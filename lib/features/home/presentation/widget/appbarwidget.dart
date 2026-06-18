
import 'package:flutter/material.dart';
class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    super.key, required this.onTap, required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.grey.shade400,
        child: Icon(icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
