import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huawei_map/map.dart' as huawei;
import 'package:neo_flutter_base/core/util/device.dart';
import 'package:neo_flutter_base/core/util/neo_logger.dart';
import 'package:neo_flutter_base/core/widget/map/types/neo_bitmap_descriptor.dart';
import 'package:neo_flutter_base/core/widget/map/types/neo_camera_position.dart';
import 'package:neo_flutter_base/core/widget/map/types/neo_lat_lng.dart';
import 'package:neo_flutter_base/core/widget/map/types/neo_polygon.dart';
import 'package:neo_flutter_base/product/theme/theme_manager.dart';

class MapUtil {
  static const _turkeyNorthWest = NeoLatLng(42.35854392, 25.87280273);
  static const _turkeySouthEast = NeoLatLng(36.66841892, 45.29663086);
  static const double minCameraZoom = 10;
  static const double maxCameraZoom = 18;
  static const double defaultCameraZoom = 14;
  static const double _cameraTilt = 0;
  static const double _cameraBearing = 0;
  static Map<double, double> zoomMap = {18: 1, 17: 2, 16: 4, 15: 8, 14: 16, 13: 20, 12: 24, 11: 30, 10: 40};

  static NeoLatLng getCenterOfPolygon({List<NeoLatLng>? locations}) {
    if (locations == null || locations.isEmpty) {
      locations = [_turkeyNorthWest, _turkeySouthEast];
    }
    final List<double> longitudes = locations.map((e) => e.longitude).toList();
    final List<double> latitudes = locations.map((e) => e.latitude).toList();

    latitudes.sort();
    longitudes.sort();

    final lowX = latitudes[0];
    final highX = latitudes[latitudes.length - 1];
    final lowY = longitudes[0];
    final highY = longitudes[latitudes.length - 1];

    final centerX = lowX + ((highX - lowX) / 2);
    final centerY = lowY + ((highY - lowY) / 2);

    return NeoLatLng(centerX, centerY);
  }

  static Future<NeoLatLng> getCoordinatesFromLocation(String location) async {
    try {
      List<Location> locations = await locationFromAddress(location);
      if (locations.isNotEmpty) {
        NeoLatLng latLng = NeoLatLng(locations[0].latitude, locations[0].longitude);
        return latLng;
      }
      return MapUtil.getCenterOfPolygon();
    } on Exception catch (e) {
      NeoLogger.instance.i(e.toString());
      return MapUtil.getCenterOfPolygon();
    }
  }

  static Set<NeoPolygon> getPolygon(List<NeoLatLng> locations, String polygonId) {
    Set<NeoPolygon> polygons = {};
    Color? primaryColor = ThemeManager.instance?.getCurrentTheme.colorTheme.primaryColor;
    polygons.add(
      NeoPolygon(
        polygonId: polygonId,
        points: locations,
        strokeWidth: 1,
        fillColor: primaryColor?.withOpacity(0.4) ?? Colors.green.withOpacity(0.4),
        strokeColor: primaryColor ?? Colors.green,
      ),
    );

    return polygons;
  }

  ///Get icon for polygon marker
  static Future<NeoBitmapDescriptor> getIcon(String marker) async {
    if (Platform.isIOS) {
      Uint8List? list = await _getBytesFromAsset(marker, 80);
      if (list != null) {
        return NeoBitmapDescriptor(BitmapDescriptor.fromBytes(list), null);
      }
    } else if (DeviceUtil.isHMSAvailable) {
      return NeoBitmapDescriptor(null, await huawei.BitmapDescriptor.fromAssetImage(const ImageConfiguration(), marker));
    }
    return NeoBitmapDescriptor(await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), marker), null);
  }

  ///Converting Asset image to BitmapDescriptor
  static Future<Uint8List?> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }

  static Future<NeoBitmapDescriptor> getCampaignMarker(String imagePath) async {
    Color? primaryColor = ThemeManager.instance?.getCurrentTheme.colorTheme.primaryColor;
    const Size size = Size(150, 150);
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint shadowPaint = Paint()..color = Colors.white.withOpacity(0.4);
    const double shadowWidth = 15.0;

    final Paint borderPaint = Paint()..color = primaryColor ?? Colors.green;
    const double borderWidth = 3.0;

    final Paint whitePaint = Paint()..color = Colors.white;

    const double imageOffset = shadowWidth + borderWidth;

    // Add shadow circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth, size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
              shadowWidth + 7, shadowWidth + 7, (size.width - (shadowWidth * 2)) - 14, (size.height - (shadowWidth * 2)) - 14),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        whitePaint);

    // Oval for the image
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset, size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await _getUiImage(imagePath); // Alternatively use your own method to get the image
    paintImage(
      canvas: canvas,
      image: image,
      rect: oval,
      fit: BoxFit.none,
    );

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      final Uint8List uInt8List = byteData.buffer.asUint8List();

      if (DeviceUtil.isHMSAvailable) {
        return NeoBitmapDescriptor(null, huawei.BitmapDescriptor.fromBytes(uInt8List));
      }
      return NeoBitmapDescriptor(BitmapDescriptor.fromBytes(uInt8List), null);
    } else {
      return getIcon(imagePath);
    }
  }

  static Future<ui.Image> _getUiImage(String imageAssetPath) async {
    ByteData data = await rootBundle.load(imageAssetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 70);
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  static void initHuaweiMap() {
    huawei.HuaweiMapInitializer.initializeMap();
    huawei.HuaweiMapInitializer.setApiKey(
        apiKey: "DAEDAHyU2RbalYg4kKp3eusdympxE/ODup1j05TxrO5SMveSu8fqUDOjlgX0I3LNMuMP1U6sU12THaGzdTV3yahtFGpsDnfIRnKgfA==");
    NeoLogger.instance.i("Huawei Map Initialized");
  }

  static NeoCameraPosition? getNeoCameraPosition() {
    return NeoCameraPosition(
      zoom: minCameraZoom,
      bearing: _cameraBearing,
      tilt: _cameraTilt,
      target: MapUtil.getCenterOfPolygon(),
    );
  }
}
