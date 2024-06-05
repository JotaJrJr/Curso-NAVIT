import 'package:curso_navit/draggable/draggable_page.dart';
import 'package:curso_navit/draggable_multi_app/draggable_multi_page.dart';
import 'package:curso_navit/formas_custom_painter.dart';
import 'package:curso_navit/snack_bar_page.dart';
import 'package:curso_navit/ui_example.dart';
import 'package:flutter/material.dart';

import 'calculadora/view/calculator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UiExample())),
        title: const Text('Examplo UI'),
      ),
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FormasCustomPainter())),
        title: const Text('Formas Custom Painter'),
      ),
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Calculator())),
        title: const Text('Calculadora'),
      ),
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DraggablePage())),
        title: const Text('Draggable'),
      ),
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SnackBarPage())),
        title: const Text('SnackBar Examples'),
      ),
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DraggableMultiApp())),
        title: const Text('MultiApp Draggable'),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return _list[index];
              },
            )
          ],
        ),
      ),
    );
  }
}
