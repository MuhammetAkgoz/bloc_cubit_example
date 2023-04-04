import 'package:flutter/material.dart';

abstract class AssetConstants {
  static DTIcons icons = DTIcons();

  static String toLotti(String name) => 'assets/lottie/$name.json';
  static String toJpg(String name) => 'assets/image/$name.jpg';
  static String toPng(String name) => 'assets/image/$name.png';
  static String toIcon(String name) => 'assets/icon/ic_$name.svg';
  static String toJson(String name) => 'assets/mock/$name.json';
}

@immutable
class DTIcons {
  final String searchGreen = AssetConstants.toIcon("search_green");
  final String addGreen = AssetConstants.toIcon("add_green");
  final String seedling = AssetConstants.toIcon("seedling");
  final String removeGrey = AssetConstants.toIcon("grey_remove");
  final String rightArrowGreen = AssetConstants.toIcon("right_arrow_green");
  final String rightArrowWhiteSmall = AssetConstants.toIcon("right_arrow_white_small");
  final String rightArrowGreenSmall = AssetConstants.toIcon("right_arrow_green_small");
  final String leftArrowWhite = AssetConstants.toIcon("left_arrow_white");
  final String rightArrowWhite = AssetConstants.toIcon("right_arrow_white");
  final String inputRightArrow = AssetConstants.toIcon("input_right_arrow");
  final String downArrowGreen = AssetConstants.toIcon("down_arrow_green");
  final String cameraPermission = AssetConstants.toIcon("camera_permission");
  final String calendar = AssetConstants.toIcon("calendar");
  final String gallery = AssetConstants.toIcon("gallery");
  final String microphone = AssetConstants.toIcon("microphone");
  final String notification = AssetConstants.toIcon("notification");
  final String location = AssetConstants.toIcon("location");
  final String humidity = AssetConstants.toIcon("humidity");
  final String precipitation = AssetConstants.toIcon("precipitation");
  final String windSpeed = AssetConstants.toIcon("wind_speed");
  final String windDirection = AssetConstants.toIcon("wind_direction");
  final String satellite = AssetConstants.toIcon("satellite");
  final String mapPin = AssetConstants.toIcon("map_pin");
  final String marker = AssetConstants.toPng("ic_marker");
  final String pencilGreen = AssetConstants.toIcon("pencil_green");
  final String home = AssetConstants.toIcon("home");
  final String profile = AssetConstants.toIcon("profil_ayar");
  final String hugeProfilePhoto = AssetConstants.toIcon("huge_profile_photo");
  final String whiteNotification = AssetConstants.toIcon("bildirim");
  final String close = AssetConstants.toIcon("close");
  final String back = AssetConstants.toIcon("back");
  final String TL = AssetConstants.toIcon("TL");
  final String petrolStation = AssetConstants.toPng("ic_petrol_station");
  final String clear = AssetConstants.toIcon("clear");
  final String clearDisable = AssetConstants.toIcon("clear_disable");
  final String undo = AssetConstants.toIcon("undo");
  final String undoDisable = AssetConstants.toIcon("undo_disable");
  final String filter = AssetConstants.toIcon("filter");
  final String locationCircle = AssetConstants.toIcon("location_circle");
  final String defaultUserIcon = AssetConstants.toIcon("default_user_photo");
  final String successfulTransaction = AssetConstants.toIcon("ok");
  final String mapFilter = AssetConstants.toIcon("map_filter");
  final String whiteArrow = AssetConstants.toIcon("input_right_arrow_white");
  final String exit = AssetConstants.toIcon("header_exit");
  final String check = AssetConstants.toIcon("check");
  final String lock = AssetConstants.toIcon("lock");
  final String setting = AssetConstants.toIcon("setting");
  final String pdf = AssetConstants.toIcon("pdf");
  final String denizbank = AssetConstants.toIcon("denizbank_logo");
  final String phone = AssetConstants.toIcon("phone_outline");
  final String www = AssetConstants.toIcon("outline_www");
  final String locationOutline = AssetConstants.toIcon("outline_location");

  /// Common Button Icons
  final String commonError = AssetConstants.toIcon("common_error");
  final String commonInfo = AssetConstants.toIcon("common_info");
  final String commonSuccess = AssetConstants.toIcon("common_success");
  final String commonWarning = AssetConstants.toIcon("common_warning");
}

@immutable
class DTImages {
  static const PRODUCER_CARD = 'img_producer_card';
  static const HEADER_HOME = 'img_header_home_bg';
  static const tutorialBackground = 'img_tutorial_bg';
  static const dtLogo = 'img_dt_logo';
  static const bankScreen = 'img_bank_screen';
  static const engineerScreen = 'img_engineer_screen';
  static const satelliteScreen = 'img_satellite_screen';
}
