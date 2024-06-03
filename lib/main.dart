import 'package:curso_navit/hero_widget/first_screen.dart';
import 'package:curso_navit/ui_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // theme: DefaultTheme
      // home: const HomePage(),

      // home: UiHomePage(),
      home: FirstScreen(),
    );
  }
}
