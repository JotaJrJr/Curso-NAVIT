import 'package:flutter/material.dart';
import 'dart:math' as math;

class SeventhShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4;

    // Centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Angulo inicial
    double startAngle = -math.pi / 2;

    List<Offset> points = List.generate(6, (i) {
      double angle = startAngle + (2 * math.pi / 6 * i);
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    path.lineTo(points[0].dx, points[0].dy);

    Path roundedPath = Path();
    for (int i = 0; i < points.length; i++) {
      int nextIndex = (i + 1) % points.length;
      roundedPath.addPolygon([points[i], points[nextIndex]], true);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
