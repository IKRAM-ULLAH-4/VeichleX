import 'package:flutter/material.dart';

/// -------------------------------
/// RESPONSIVE TOP NAV BAR
/// -------------------------------
class ResponsiveTopNavBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ResponsiveTopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 768;

    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      automaticallyImplyLeading: isMobile,

      title: Row(
        children: const [
          Icon(Icons.directions_car, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            "Elite Motors",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),

      // Desktop / Tablet Navigation
      actions: isMobile
          ? null
          : const [
              NavAction(label: "Dashboard", selected: true),
              NavAction(label: "Inventory"),
              NavAction(label: "Admin"),
              SizedBox(width: 16),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// -------------------------------
/// DESKTOP NAV BUTTON
/// -------------------------------
class NavAction extends StatelessWidget {
  final String label;
  final bool selected;

  const NavAction({
    super.key,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: selected ? Colors.blue : Colors.black87,
        textStyle: TextStyle(
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      child: Text(label),
    );
  }
}

/// -------------------------------
/// MOBILE DRAWER
/// -------------------------------
class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.directions_car, color: Colors.blue),
              title: Text(
                "Elite Motors",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(),

            _drawerItem(context, Icons.dashboard, "Dashboard"),
            _drawerItem(context, Icons.inventory, "Inventory"),
            _drawerItem(context, Icons.admin_panel_settings, "Admin"),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
