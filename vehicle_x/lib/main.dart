import 'package:flutter/material.dart';
import 'package:vehicle_x/services/paymentlistener.dart';
import 'package:vehicle_x/succes_scree.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // ✅ Start listening for Stripe deep links
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PaymentListener.start(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elite Motors',

      // ✅ ROUTES FOR STRIPE CALLBACKS
      routes: {
        '/': (context) => const DashboardScreen(),
        '/payment-success': (context) => const PaymentSuccess(),
        '/payment-cancel': (context) => const PaymentSuccess(),
      },

      initialRoute: '/',
    );
  }
}
