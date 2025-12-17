import 'package:flutter/material.dart';
import 'package:vehicle_x/services/strip_services.dart';
// import '../services/stripe_service.dart';
import '../model/vehicle_model.dart';

class BookingScreen extends StatelessWidget {
  final Vehicle vehicle;
  const BookingScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Vehicle")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Booking: ${vehicle.name}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await StripeService.openCheckout();
              },
              child: const Text("Proceed to Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
