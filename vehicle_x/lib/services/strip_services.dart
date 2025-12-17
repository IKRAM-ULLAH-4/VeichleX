import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class StripeService {
  static Future<void> openCheckout() async {
    debugPrint("👉 StripeService.openCheckout called");

    const String backendUrl =
        "https://newone-for-mbl.onrender.com/create-checkout-session";

    debugPrint(" Sending request to backend");

    final response = await http.post(
      Uri.parse(backendUrl),
      headers: {"Content-Type": "application/json"},
    );

    debugPrint(" Response status: ${response.statusCode}");
    debugPrint(" Response body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("Backend error");
    }

    final data = json.decode(response.body);
    final String checkoutUrl = data["url"];

    debugPrint(" Checkout URL: $checkoutUrl");

    final uri = Uri.parse(checkoutUrl);

    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint(" Browser opened: $opened");

    if (!opened) {
      throw Exception("Could not open browser");
    }
  }
}
