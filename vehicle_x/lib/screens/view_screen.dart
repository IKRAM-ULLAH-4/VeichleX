import 'package:flutter/material.dart';
import 'package:vehicle_x/widgets/image_carousal.dart';
import '../model/vehicle_model.dart';
import 'booking_screen.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBar(title: Text(vehicle.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isMobile ? _mobileLayout(context) : _desktopLayout(context),
      ),
    );
  }

  Widget _mobileLayout(BuildContext context) => ListView(
    children: [
      ImageCarousel(images: vehicle.images),
      const SizedBox(height: 20),
      _details(context),
    ],
  );

  Widget _desktopLayout(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: ImageCarousel(images: vehicle.images)),
      const SizedBox(width: 20),
      Expanded(child: _details(context)),
    ],
  );

  Widget _details(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "\$${vehicle.price}",
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(vehicle.description),
      const SizedBox(height: 20),
      const Text(
        "Specifications",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(vehicle.specs.join("\n")),
      const SizedBox(height: 30),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: const Text("Book Now"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookingScreen(vehicle: vehicle),
              ),
            );
          },
        ),
      ),
    ],
  );
}
