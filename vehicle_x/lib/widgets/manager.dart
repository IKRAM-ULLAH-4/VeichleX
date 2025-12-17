import 'package:flutter/material.dart';

class ManagerAnalyticsDashboard extends StatelessWidget {
  const ManagerAnalyticsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Light professional grey
      appBar: AppBar(
        title: const Text("Manager Overview", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Analytics Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            const SizedBox(height: 20),
            
            // ---------- ANALYTICS GRID ----------
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildStatCard(
                  title: "Available",
                  value: "42",
                  subtitle: "Cars in stock",
                  icon: Icons.directions_car_filled_rounded,
                  color: Colors.blue,
                ),
                _buildStatCard(
                  title: "Test Drives",
                  value: "12",
                  subtitle: "Scheduled today",
                  icon: Icons.timer_rounded,
                  color: Colors.orange,
                ),
                _buildStatCard(
                  title: "Revenue",
                  value: "\$128k",
                  subtitle: "Monthly growth",
                  icon: Icons.account_balance_wallet_rounded,
                  color: Colors.green,
                  isRevenue: true,
                ),
                _buildStatCard(
                  title: "Total Fleet",
                  value: "156",
                  subtitle: "Vehicles total",
                  icon: Icons.analytics_rounded,
                  color: Colors.purple,
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // ---------- RECENT ACTIVITY SECTION ----------
            const Text(
              "Recent Performance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildPerformanceTile(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
    bool isRevenue = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              if (isRevenue)
                const Icon(Icons.trending_up, color: Colors.green, size: 20),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceTile() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Goal Reached",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  "85% of Monthly Target",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          CircularProgressIndicator(
            value: 0.85,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 6,
          ),
        ],
      ),
    );
  }
}