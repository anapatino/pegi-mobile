import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData iconD;
  final Color iconColor;
  final double size;
  AppIcon(
      {Key? key, required this.iconD, required this.iconColor, this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(size / 2)
          // BoxDecoration
          ),
      child: Icon(iconD, color: iconColor, size: 20),
    );
  }
}
