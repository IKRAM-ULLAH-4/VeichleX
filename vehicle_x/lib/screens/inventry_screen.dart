import 'package:flutter/material.dart';
import 'package:vehicle_x/widgets/inventry_card.dart';
import '../model/vehicle_model.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicles = Vehicle.sampleData();
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Inventory")),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 12 : 20),
        child: GridView.builder(
          itemCount: vehicles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.25,
          ),
          itemBuilder: (_, i) => InventoryCard(vehicle: vehicles[i]),
        ),
      ),
    );
  }
}
