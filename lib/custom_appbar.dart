import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();

    // Draw a straight line at the top
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // Draw a curve at the bottom
    path.lineTo(size.width, size.height * 0.9);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.4, // Adjust this value to control the depth of the curve
      0,
      size.height * 0.9,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
