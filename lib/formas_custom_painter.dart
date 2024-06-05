import 'package:curso_navit/custom_painter/seventh_shape.dart';
import 'package:flutter/material.dart';

import 'custom_painter/fifth_shape.dart';
import 'custom_painter/first_shape.dart';
import 'custom_painter/fourth_shape.dart';
import 'custom_painter/second_shape.dart';
import 'custom_painter/sixth_shape.dart';
import 'custom_painter/third_shape.dart';

class FormasCustomPainter extends StatefulWidget {
  const FormasCustomPainter({super.key});

  @override
  State<FormasCustomPainter> createState() => _FormasCustomPainterState();
}

class _FormasCustomPainterState extends State<FormasCustomPainter> {
  double _angle = 0.5;
  double _size = 0.5;

  int _currentPage = 0;

  final List<CustomPainter> _list = [
    FirstShape(),
    SecondShape(),
    ThirdShape(),
    FourthShape(),
    FifthShape(),
    SixthShape(),
    SeventhShape(),
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int nextPage = _pageController.page!.round();
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  void _resetSliders() {
    if (_pageController.page == _pageController.page!.roundToDouble()) {
      setState(() {
        _angle = 0.5;
        _size = 0.5;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController
          .previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInCubic,
          )
          .then((_) => _resetSliders());
    }
  }

  void _nextPage() {
    if (_currentPage < _list.length - 1) {
      _pageController
          .nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          )
          .then((_) => _resetSliders());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formas Custom Painter'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: PageView.builder(
                controller: _pageController,
                itemCount: _list.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Text(
                        "Forma ${index + 1}",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Transform.rotate(
                        angle: _angle * 6.28,
                        child: Container(
                          color: Colors.red,
                          child: CustomPaint(
                            size: Size(_size * 220, _size * 220),
                            painter: _list[index],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: _currentPage > 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _currentPage > 0 ? _previousPage : null,
                ),
              ),
              Visibility(
                visible: _currentPage < _list.length - 1,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _currentPage < _list.length - 1 ? _nextPage : null,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Ângulo"),
          Slider(
            value: _angle,
            onChanged: (value) {
              setState(() {
                _angle = value;
              });
            },
          ),
          const Text("Tamanho"),
          Slider(
            value: _size,
            onChanged: (value) {
              setState(() {
                _size = value;
              });
            },
          ),
          const SizedBox(
            height: 16,
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
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
