import 'package:flutter/material.dart';
import 'dart:math' as math;

class FifthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4; // tamanho do hexagono
    double cornerRadius = 5; // canto arredondado supostamente

    // Calcular o centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Angulo inicial
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double angle = -math.pi / 2 + (2 * math.pi / 6 * i);
      points.add(Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      ));
    }

    // Primeiro ponto
    path.moveTo(points[0].dx, points[0].dy);

    // Desenhar linhas e pequenos arcos nos cantos
    for (int i = 0; i < points.length; i++) {
      int nextIndex = (i + 1) % points.length;
      Offset controlPoint = Offset(
        (points[i].dx + points[nextIndex].dx) / 2,
        (points[i].dy + points[nextIndex].dy) / 2,
      );

      // bump pequeno para arredondar
      double midAngle = math.pi / 3 * i - math.pi / 6;
      controlPoint = Offset(
        controlPoint.dx - cornerRadius * math.cos(midAngle),
        controlPoint.dy - cornerRadius * math.sin(midAngle),
      );

      path.quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        points[nextIndex].dx,
        points[nextIndex].dy,
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
