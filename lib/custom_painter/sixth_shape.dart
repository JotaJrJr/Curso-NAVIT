import 'package:flutter/material.dart';
import 'dart:math' as math;

class SixthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4; // tamanho
    double cornerRadius = 5; // border radius

    // Centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // vertices
    List<Offset> points = List.generate(6, (i) {
      double angle = 2 * math.pi / 6 * i - math.pi / 2;
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    for (int i = 0; i < points.length; i++) {
      if (i == 0) {
        path.moveTo(points[i].dx, points[i].dy);
      }
      int nextIndex = (i + 1) % points.length;
      Offset midPoint = Offset((points[i].dx + points[nextIndex].dx) / 2, (points[i].dy + points[nextIndex].dy) / 2);

      path.lineTo(midPoint.dx, midPoint.dy);
      path.quadraticBezierTo(points[nextIndex].dx, points[nextIndex].dy, midPoint.dx, midPoint.dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
