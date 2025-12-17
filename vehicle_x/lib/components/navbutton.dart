import 'package:flutter/material.dart';

// ignore: unused_element
class NavButton extends StatelessWidget {
  final String label;
  final bool selected;
  final IconData? icon; // Optional icon for small screens
  final VoidCallback? onPressed;

  const NavButton({
    required this.label,
    this.selected = false,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // For web/desktop, a TextButton provides better hover/focus effects.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          backgroundColor: selected
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
