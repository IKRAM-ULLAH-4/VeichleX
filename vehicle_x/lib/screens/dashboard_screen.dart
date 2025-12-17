import 'package:flutter/material.dart';
import 'package:vehicle_x/model/vehicle_model.dart';
import '../widgets/stat_card.dart';
import '../widgets/vehicle_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // 1. Current Index for Navigation
  int _currentTab = 0;

  // Titles for the AppBar
  final List<String> _titles = [
    "Manager Dashboard",
    "Car Inventory",
    "Analytics Reports",
    "Settings"
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // ---------- THE DRAWER ----------
      drawer: MobileDrawer(
        currentIndex: _currentTab,
        onTabSelected: (index) {
          setState(() => _currentTab = index);
          Navigator.pop(context); // Close drawer on selection
        },
      ),

      // ---------- DYNAMIC APPBAR ----------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_open_rounded, color: Colors.blueAccent, size: 28),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          _titles[_currentTab],
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.grey),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ---------- THE CONTENT (Switches based on index) ----------
      body: IndexedStack(
        index: _currentTab,
        children: [
          _buildHomeTab(isMobile),      // Tab 0
          _buildInventoryTab(isMobile), // Tab 1
          _buildReportsTab(isMobile),   // Tab 2
          const Center(child: Text("Settings Module Coming Soon")), // Tab 3
        ],
      ),
    );
  }

  // --- TAB 0: MAIN DASHBOARD ---
  Widget _buildHomeTab(bool isMobile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Quick Stats", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 2 : 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: const [
              StatCard(title: "Total", value: "156", subtitle: "Fleet size", icon: Icons.apps, color: Colors.blue),
              StatCard(title: "Revenue", value: "\$1.2M", subtitle: "Monthly", icon: Icons.payments, color: Colors.green),
            ],
          ),
          const SizedBox(height: 30),
          const Text("Performance Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          _buildMiniReportCard(),
        ],
      ),
    );
  }

  // --- TAB 1: FULL INVENTORY GRID ---
  Widget _buildInventoryTab(bool isMobile) {
    final vehicles = Vehicle.sampleData();
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: vehicles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        mainAxisExtent: 260, // Matches your fixed VehicleCard height
      ),
      itemBuilder: (context, index) => VehicleCard(vehicle: vehicles[index]),
    );
  }

  // --- TAB 2: DETAILED ANALYTICS ---
  Widget _buildReportsTab(bool isMobile) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        StatCard(title: "Test Drives", value: "24", subtitle: "Today", icon: Icons.speed, color: Colors.orange),
        SizedBox(height: 15),
        StatCard(title: "New Leads", value: "+14", subtitle: "Since yesterday", icon: Icons.trending_up, color: Colors.purple),
        SizedBox(height: 15),
        StatCard(title: "Sold Units", value: "09", subtitle: "This week", icon: Icons.shopping_bag, color: Colors.teal),
      ],
    );
  }

  Widget _buildMiniReportCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.auto_graph, color: Colors.white, size: 40),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Monthly Goal", style: TextStyle(color: Colors.white70)),
                Text("82% Completed", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------------------
// CUSTOM DRAWER COMPONENT
// -------------------------------------------------------------------------
class MobileDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const MobileDrawer({super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_car_filled, color: Colors.blueAccent, size: 40),
                  SizedBox(height: 10),
                  Text("ELITE MOTORS", style: TextStyle(color: Colors.white, letterSpacing: 2, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          _drawerTile(0, Icons.dashboard_rounded, "Dashboard"),
          _drawerTile(1, Icons.inventory_2_rounded, "Inventory"),
          _drawerTile(2, Icons.analytics_rounded, "Reports"),
          _drawerTile(3, Icons.settings_rounded, "Settings"),
          const Spacer(),
          const Divider(),
          _drawerTile(-1, Icons.logout_rounded, "Logout", isLogout: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerTile(int index, IconData icon, String label, {bool isLogout = false}) {
    final bool isSelected = currentIndex == index;
    return ListTile(
      onTap: () => isLogout ? null : onTabSelected(index),
      leading: Icon(icon, color: isLogout ? Colors.red : (isSelected ? Colors.blueAccent : Colors.grey)),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isLogout ? Colors.red : (isSelected ? Colors.blueAccent : Colors.black87),
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blue.withOpacity(0.05),
    );
  }
}