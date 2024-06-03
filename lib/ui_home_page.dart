import 'package:flutter/material.dart';
import 'dart:math' as math;

class UiHomePage extends StatelessWidget {
  const UiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rounded Hexagon Example'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            child: CustomPaint(
              size: const Size(300, 300), // You can change this as needed
              painter: EighthShape(),
            ),
          ),
          Container(
            color: Colors.blue,
            child: ClipRect(
              clipper: CustomImageClipper(),
              child: Container(
                color: Colors.red,
                child: CustomPaint(
                  size: const Size(300, 300), // You can change this as needed
                  painter: EighthShape(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    double cutWidth = size.width * 0.1; // Cut 10% from both sides
    double cutHeight = size.height * 0.1; // Cut 10% from top and bottom

    return Rect.fromLTRB(cutWidth, cutHeight, size.width - cutWidth, size.height - cutHeight);

    // return Rect.fromLTRB(cutWidth, 0.0, size.width - cutWidth, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class FirstShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();

    // Calculate the center and radius for the hexagon

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 3; // Adjust for desired size
    double cornerRadius = 10; // Smaller value for slight rounding

    // Create points for the hexagon vertices
    List<Offset> points = List.generate(6, (i) {
      double angle = math.pi / 3 * i + math.pi / 6;
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    // Create the rounded vertices
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

class SecondShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 3; // Adjust size to fit within canvas
    double cornerRadius = 5; // Small corner radius for slight rounding

    // Calculate the center
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Points for hexagon vertices
    var points = List.generate(6, (i) {
      double angle = 2 * math.pi / 6 * i;
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    // Draw each side with a slight arc at the vertices
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

class ThirdShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 3; // Adjust for the size of the hexagon
    double cornerRadius = 5; // Very small corner radius to keep corners only slightly rounded

    // Calculate the center
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Starting angle
    double startAngle = -math.pi / 6;

    // Create points for the hexagon vertices
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double angle = startAngle + (math.pi / 3 * i);
      points.add(Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      ));
    }

    // Move to the first point
    path.moveTo(points[0].dx, points[0].dy);

    // Draw lines and very slight arcs at corners
    for (int i = 0; i < 6; i++) {
      int nextIndex = (i + 1) % 6;
      path.lineTo(points[i].dx, points[i].dy);

      // Calculate a control point for slight rounding
      double controlX = (points[i].dx + points[nextIndex].dx) / 2;
      double controlY = (points[i].dy + points[nextIndex].dy) / 2;

      // Adjust control point slightly inward to create a small "bump"
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

class ForthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 3; // Adjust for the size of the hexagon
    double cornerRadius = 3; // Very small corner radius to keep corners only slightly rounded

    // Calculate the center
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Starting angle
    double startAngle = -math.pi / 6;

    // Create points for the hexagon vertices
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double angle = startAngle + (math.pi / 3 * i);
      points.add(Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      ));
    }

    // Move to the first point
    path.moveTo(points[0].dx, points[0].dy);

    // Draw straight lines to each point and add a very subtle arc at corners
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

class FifthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4; // Adjust for the size of the hexagon
    double cornerRadius = 5; // Very small corner radius for subtle rounding

    // Calculate the center
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Generate the points for the hexagon vertices
    List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      double angle = -math.pi / 2 + (2 * math.pi / 6 * i);
      points.add(Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      ));
    }

    // Move to the first point
    path.moveTo(points[0].dx, points[0].dy);

    // Draw lines and small arcs at corners
    for (int i = 0; i < points.length; i++) {
      int nextIndex = (i + 1) % points.length;
      Offset controlPoint = Offset(
        (points[i].dx + points[nextIndex].dx) / 2,
        (points[i].dy + points[nextIndex].dy) / 2,
      );

      // Add a slight bump to the control point for rounding
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

class SixthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4; // Adjust for the size of the hexagon
    double cornerRadius = 5; // Reduced corner radius for subtle rounding

    // Calculate the center
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Points for hexagon vertices
    List<Offset> points = List.generate(6, (i) {
      double angle = 2 * math.pi / 6 * i - math.pi / 2;
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    // Adding subtle rounding at corners
    for (int i = 0; i < points.length; i++) {
      if (i == 0) {
        path.moveTo(points[i].dx, points[i].dy);
      }
      int nextIndex = (i + 1) % points.length;
      Offset midPoint = Offset((points[i].dx + points[nextIndex].dx) / 2, (points[i].dy + points[nextIndex].dy) / 2);

      // Adjust midPoint slightly for the rounding
      path.lineTo(midPoint.dx, midPoint.dy);
      path.quadraticBezierTo(points[nextIndex].dx, points[nextIndex].dy, midPoint.dx, midPoint.dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SeventhShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4; // Radius of the hexagon
    double cornerRadius = 2; // Very subtle corner rounding

    // Calculate the center
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Calculate the starting angle to point the top vertex directly upwards
    double startAngle = -math.pi / 2; // Points directly upwards

    // Generate the points for the hexagon vertices
    List<Offset> points = List.generate(6, (i) {
      double angle = startAngle + (2 * math.pi / 6 * i);
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    // Connect each vertex with straight lines and add subtle rounding
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    path.lineTo(points[0].dx, points[0].dy);

    // Subtle rounding at the vertices
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

class EighthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    double radius = size.width / 4; // Raio do hexágono
    double cornerRadius = 10; // Raio do arredondamento dos vértices

    // Calcula o centro
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Ângulo inicial apontando para o topo
    double startAngle = -math.pi / 2;

    // Gera os pontos para os vértices do hexágono
    List<Offset> points = List.generate(6, (i) {
      double angle = startAngle + (2 * math.pi / 6 * i);
      return Offset(
        centerX + radius * math.cos(angle),
        centerY + radius * math.sin(angle),
      );
    });

    // Conecta cada vértice com linhas retas e adiciona arredondamento sutil
    for (int i = 0; i < points.length; i++) {
      int nextIndex = (i + 1) % points.length;
      path.lineTo(points[i].dx, points[i].dy);

      // Adiciona um pequeno arco para arredondar o vértice
      Offset midPoint = Offset((points[i].dx + points[nextIndex].dx) / 2, (points[i].dy + points[nextIndex].dy) / 2);
      path.arcToPoint(points[nextIndex], radius: Radius.circular(cornerRadius), clockwise: false);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
