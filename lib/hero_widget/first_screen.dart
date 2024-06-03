import 'package:flutter/material.dart';

import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Hero(
              tag: 'hero',
              child: Icon(
                Icons.abc,
                size: 120,
              ),
            ),
          ),
          HeroControllerScope(
            controller: HeroController(
              createRectTween: (begin, end) {
                return MaterialRectArcTween(begin: begin, end: end);
              },
            ),
            child: const Hero(
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
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const SecondScreen();
              // }));

              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const SecondScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation.isCompleted ? const AlwaysStoppedAnimation(1) : animation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(seconds: 5),
                  ));
            },
            child: const Text('Go to second screen'),
          ),
        ],
      ),
    );
  }
}
