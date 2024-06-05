import 'package:flutter/material.dart';
import 'dart:math' as math;

class ThirdShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 3; // tamaho
    double cornerRadius = 5; // border radius

    // Centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // angulo inicial
    double startAngle = -math.pi / 6;

    // vertices
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double angle = startAngle + (math.pi / 3 * i);
      points.add(Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      ));
    }

    // primeiro ponto
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < 6; i++) {
      int nextIndex = (i + 1) % 6;
      path.lineTo(points[i].dx, points[i].dy);

      double controlX = (points[i].dx + points[nextIndex].dx) / 2;
      double controlY = (points[i].dy + points[nextIndex].dy) / 2;

      double midAngle = startAngle + (math.pi / 3 * i) + math.pi / 6;
      controlX -= cornerRadius * math.cos(midAngle);
      controlY -= cornerRadius * math.sin(midAngle);

      path.quadraticBezierTo(controlX, controlY, points[nextIndex].dx, points[nextIndex].dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
