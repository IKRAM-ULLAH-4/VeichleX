import 'package:flutter/material.dart';
import 'package:vehicle_x/components/recent_booking.dart';
import 'package:vehicle_x/model/vehicle_model.dart';
import 'package:vehicle_x/widgets/top_navbar.dart';
import '../widgets/stat_card.dart';
import '../widgets/vehicle_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicles = Vehicle.sampleData();
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Scaffold(
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 10 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveTopNavBar(),
            const SizedBox(height: 24),

            _title("Welcome to Elite Motors", isMobile ? 22 : 26),
            _subtitle(
              "Manage your luxury car showroom efficiently",
              isMobile ? 14 : 16,
            ),

            const SizedBox(height: 24),

            /// Stats
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                StatCard(
                  title: "Total Vehicles",
                  value: "6",
                  subtitle: "+2 this month",
                  icon: Icons.directions_car,
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Featured Vehicles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title("Featured Vehicles", isMobile ? 18 : 20),
                Text(
                  "View All →",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: isMobile ? 250 : 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: vehicles.length,
                separatorBuilder: (_, __) => const SizedBox(width: 15),
                itemBuilder: (_, i) => VehicleCard(vehicle: vehicles[i]),
              ),
            ),

            const SizedBox(height: 30),

            RecentBooking(),
          ],
        ),
      ),
    );
  }

  // ---------- Helpers ----------
  Widget _title(String text, double size) => Text(
    text,
    style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
  );

  Widget _subtitle(String text, double size) => Text(
    text,
    style: TextStyle(fontSize: size, color: Colors.grey),
  );
}
