import 'package:flutter/material.dart';
import 'dart:math' as math;

class SecondShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 3; // Tamanho
    double cornerRadius = 5; // border radius

    // Centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // vertices
    var points = List.generate(6, (i) {
      double angle = 2 * math.pi / 6 * i;
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    for (int i = 0; i < points.length; i++) {
      int nextIndex = (i + 1) % points.length;
      path.lineTo(points[i].dx, points[i].dy);
      path.arcToPoint(points[nextIndex], radius: Radius.circular(cornerRadius), clockwise: true);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
