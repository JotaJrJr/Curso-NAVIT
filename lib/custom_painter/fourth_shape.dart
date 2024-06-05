import 'package:flutter/material.dart';
import 'dart:math' as math;

class FourthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 3;
    double cornerRadius = 3;

// centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Angulo inicial
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

    // ponto inicial
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < 6; i++) {
      int nextIndex = (i + 1) % 6;
      Offset halfway = Offset(
        (points[i].dx + points[nextIndex].dx) / 2,
        (points[i].dy + points[nextIndex].dy) / 2,
      );
      path.lineTo(halfway.dx, halfway.dy);
      path.quadraticBezierTo(points[nextIndex].dx, points[nextIndex].dy, halfway.dx, halfway.dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
