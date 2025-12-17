import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import '../main.dart'; // import navigatorKey

class PaymentListener {
  static final AppLinks _appLinks = AppLinks();

  static void start() {
    // Listen while app is running
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) _handleUri(uri);
    });

    // Handle when app was closed
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) _handleUri(uri);
    });
  }

  static void _handleUri(Uri uri) {
    debugPrint("🔗 Deep link received: $uri");

    if (uri.host == "payment-success") {
      final sessionId = uri.queryParameters["session_id"];
      debugPrint("✅ Payment success, session: $sessionId");

      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        "/payment-success",
        (route) => false, // removes all previous routes
      );
    }

    if (uri.host == "payment-cancel") {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        "/payment-cancel",
        (route) => false,
      );
    }
  }
}
