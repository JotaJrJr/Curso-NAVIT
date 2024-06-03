import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Column(
        children: [
          Center(
            child: Hero(
              tag: 'hero',
              child: Icon(
                Icons.abc,
                size: 120,
              ),
            ),
          ),
          Hero(
            tag: 'hero-text',
            child: Material(
              child: Text(
                'Hero Text',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
