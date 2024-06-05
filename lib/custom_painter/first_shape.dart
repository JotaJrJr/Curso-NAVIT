import 'package:flutter/material.dart';
import 'dart:math' as math;

class FirstShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();

    // centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double radius = size.width / 3; // tamanho
    double cornerRadius = 10; // canto arredondado

    // vertices
    List<Offset> points = List.generate(6, (i) {
      double angle = math.pi / 3 * i + math.pi / 6;
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    for (int i = 0; i < points.length; i++) {
      if (i == 0) {
        path.moveTo(points[i].dx, points[i].dy);
      } else {
        path.arcToPoint(points[i], radius: Radius.circular(cornerRadius), clockwise: false);
      }
    }

    path.arcToPoint(points[0], radius: Radius.circular(cornerRadius), clockwise: false);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
