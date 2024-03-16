import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightGreen
      ..style = PaintingStyle.fill;

    Path path = Path();
    double centerX = size.width / 2;
    double centerY = size.height;
    double radius = size.width / 2;
    double halfHeight = size.height / 2;

    path.moveTo(centerX, centerY); // Move to the bottom center
    path.arcToPoint(
      Offset(centerX, halfHeight), // Draw arc to the middle of the circle
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(centerX - radius, centerY); // Draw line to the starting point
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
