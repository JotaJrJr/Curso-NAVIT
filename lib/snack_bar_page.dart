import 'dart:math';

import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                var snackBar = SnackBar(
                  content: Text('Yay! A SnackBar!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('SnackBar Padrão'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                var snackBar = SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.info, color: Colors.white),
                      SizedBox(width: 10),
                      Text('Snackbar com efeito e shape'),
                    ],
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  duration: const Duration(seconds: 5),
                  backgroundColor: Colors.purple,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('SnackBar com Cor de Fundo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showCustomSnackBar(context, BubblePainter());
              },
              child: const Text('SnackBar com CustomPainter'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showCustomSnackBar(context, SquarePainter());
              },
              child: const Text('SnackBar com CustomPainter (Quadrado)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showCustomSnackBar(context, TrianglePainter());
              },
              child: const Text('SnackBar com CustomPainter (Triângulo)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showCustomSnackBar(context, PenthagonPainter());
              },
              child: const Text('SnackBar com CustomPainter (Estrela)'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomSnackBar(context, CustomPainter paint) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 5),
      content: CustomSnackbar(
        painter: paint,
        message: 'Snackbar com background de custompainter',
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CustomSnackbar extends StatelessWidget {
  final String message;
  final SnackBarAction? action;
  final CustomPainter painter;

  const CustomSnackbar({super.key, required this.message, this.action, required this.painter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CustomPaint(
          painter: painter,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                if (action != null)
                  TextButton(
                    onPressed: action!.onPressed,
                    child: Text(
                      action!.label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // desenhar 20 círculos no canvas
    for (int i = 0; i < 20; i++) {
      // gera aleatoriamente com raio entre 10/30
      final radius = _random.nextDouble() * 20 + 10;
      // gera aleatoriamente com x entre 0/width
      final x = _random.nextDouble() * size.width;
      // gera aleatoriamente com y entre 0/height
      final y = _random.nextDouble() * size.height;
      // desenha um círculo na posição (x, y) especificada com o raio e a pintura fornecidos
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SquarePainter extends CustomPainter {
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 20; i++) {
      final side = _random.nextDouble() * 20 + 10;
      final x = _random.nextDouble() * size.width;
      final y = _random.nextDouble() * size.height;
      canvas.drawRect(Rect.fromLTWH(x, y, side, side), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 20; i++) {
      final path = Path();
      final side = _random.nextDouble() * 20 + 10;
      final x = _random.nextDouble() * size.width;
      final y = _random.nextDouble() * size.height;
      path.moveTo(x, y);
      path.lineTo(x + side, y);
      path.lineTo(x + side / 2, y - side);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PenthagonPainter extends CustomPainter {
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 20; i++) {
      final path = Path();
      final radius = _random.nextDouble() * 20 + 10;
      final x = _random.nextDouble() * size.width;
      final y = _random.nextDouble() * size.height;
      const angle = (2 * pi) / 5;
      for (int j = 0; j < 5; j++) {
        final dx = x + radius * cos(j * angle);
        final dy = y - radius * sin(j * angle);
        if (j == 0) {
          path.moveTo(dx, dy);
        } else {
          path.lineTo(dx, dy);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
