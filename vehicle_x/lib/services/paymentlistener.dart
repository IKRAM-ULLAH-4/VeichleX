import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

class PaymentListener {
  static final AppLinks _appLinks = AppLinks();

  static void start(BuildContext context) {
    // Listen while app is running
    _appLinks.uriLinkStream.listen((Uri uri) {
      debugPrint("🔗 Deep link received: $uri");

      _handleUri(context, uri);
    });

    // Handle when app was closed
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        _handleUri(context, uri);
      }
    });
  }

  static void _handleUri(BuildContext context, Uri uri) {
    if (uri.host == "payment-success") {
      final sessionId = uri.queryParameters["session_id"];
      debugPrint("✅ Payment success, session: $sessionId");

      Navigator.pushReplacementNamed(context, "/payment-success");
    }

    if (uri.host == "payment-cancel") {
      Navigator.pushReplacementNamed(context, "/payment-cancel");
    }
  }
}
