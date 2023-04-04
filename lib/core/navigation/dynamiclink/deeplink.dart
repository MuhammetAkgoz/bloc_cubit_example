import 'dart:async';
import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';

class DTFirebaseDeeplink {
  DTFirebaseDeeplink._init();

  static DTFirebaseDeeplink? _instance;
  PendingDynamicLinkData? pendingDynamicLinkData;

  static DTFirebaseDeeplink get instance {
    _instance ??= DTFirebaseDeeplink._init();
    return _instance ?? DTFirebaseDeeplink._init();
  }

  /// Create firebase deeplink and return sharable dynamic link
  Future<String> createDynamicLinkParams(
    String menuKey,
    String queryParams,
    String title,
    String sourceUrl,
    String packageName,
  ) async {
    try{

    }
    final dynamicLinkParameters = DynamicLinkParameters(
      link: Uri.parse(
        'https://${packageName.split(".").last}.page.link/?link=${Uri.parse(sourceUrl)}&menuKey=$menuKey&$queryParams',
      ),
      uriPrefix: "https://${packageName.split(".").last}.page.link",
      androidParameters: AndroidParameters(packageName: packageName),
      iosParameters: IOSParameters(bundleId: packageName),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: title,
        imageUrl: Uri.parse(sourceUrl),
      ),
    );

    final shortDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParameters);

    return shortDynamicLink.shortUrl.toString();
  }

  void handleDeeplink(PendingDynamicLinkData? pendingDynamicLinkData) {
    final Uri? uri = pendingDynamicLinkData?.link;
    if (uri != null && (pendingDynamicLinkData?.android != null || pendingDynamicLinkData?.ios != null)) {
      final queryParams = uri.queryParameters;
      if (queryParams.isNotEmpty) {
        String? queryParamString = _mapToQueryString(queryParams);

        /// check menuKey and redirect to the related page
        DeeplinkManager.instance?.handleDeeplink(queryParamString);
      }
    }
  }

  Future<void> controlInitialDeeplinkData() async {
    /// Get any initial dynamic links
    PendingDynamicLinkData? initialLink;
    if (Platform.isIOS) {
      Uri? initLink = await AppLinks().getInitialAppLink();
      if (initLink != null) {
        initialLink = PendingDynamicLinkData(link: initLink);
      }
    } else {
      initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    }

    _handleAppCloseDeeplink(initialLink);
  }

  /// set deeplink data if app is close and newly open
  void _handleAppCloseDeeplink(PendingDynamicLinkData? pendingDynamicLinkData) {
    this.pendingDynamicLinkData = pendingDynamicLinkData;
  }

  /// control waiting deeplink in main screen
  Future<void> checkWaitingDeeplink() async {
    if (pendingDynamicLinkData != null) {
      /// Delay for news page loading
      await Future.delayed(const Duration(milliseconds: 100));
      handleDeeplink(pendingDynamicLinkData);
    }
  }

  /// convert map parameter to query because handle all deeplinks in one hand by [DeeplinkManager]
  String _mapToQueryString(Map<String, String> queryParameters) {
    String queryParams = DeeplinkConstant.DEEPLINK_SUFFIX;

    for (final mapEntry in queryParameters.entries) {
      queryParams += "${mapEntry.key}=${mapEntry.value}&";
    }

    return queryParams;
  }

  /// call from main only
  Future<void> initUniLinks() async {
    /// Attach a listener to the stream
    uriLinkStream.listen((Uri? uri) {
      SessionManagerDT.instance.handlePendingDeeplink(uri?.toString() ?? "");
    }, onError: (err) {
      NeoLogger.instance.d(err.toString());
    });
    _getWaitingUniLinks();
  }

  Future<void> _getWaitingUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      if (initialLink == null) return;
      SessionManagerDT.instance.pendingDeepLink = initialLink;
    } on PlatformException catch (err) {
      NeoLogger.instance.d(err.toString());
    }
  }
}
