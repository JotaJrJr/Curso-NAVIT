import 'package:flutter/material.dart';

import '../calculadora/view/calculator.dart';

class DraggablePage extends StatefulWidget {
  const DraggablePage({super.key});

  @override
  State<DraggablePage> createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  late DraggablePageViewModel _viewModel;

  @override
  initState() {
    super.initState();
    _viewModel = DraggablePageViewModel();
  }

  List<DraggableWidget> widgets = [
    DraggableWidget(
      widget: const Calculator(),
      position: const Offset(100, 100),
    ),
  ];

  Offset position = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: DraggablePageViewModel(),
        builder: (_, __) {
          return Stack(
            children: [
              Positioned(
                left: position.dx,
                top: position.dy,
                child: Draggable(
                  data: position,
                  feedback: const Calculator(),
                  childWhenDragging: Container(),
                  child: const Calculator(),
                  onDragEnd: (details) {
                    setState(() {
                      position = details.offset;
                    });
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class DraggablePageViewModel extends ChangeNotifier {
  List<Widget> apps = [];

  List<DraggableWidget> widgets = [
    DraggableWidget(
      widget: const Calculator(),
      position: const Offset(100, 100),
    ),
  ];

  void removeApp(Widget app) {
    apps.remove(app);
    notifyListeners();
  }

  void toggleWidgetVisibility(int index) {
    widgets[index].isVisible = !widgets[index].isVisible;
    notifyListeners();
  }

  void bringToFront(int index) {
    final widget = widgets.removeAt(index);
    widgets.add(widget);
    notifyListeners();
  }
}

class DraggableWidget {
  final Widget widget;
  Offset position;
  bool isVisible;

  DraggableWidget({
    required this.widget,
    required this.position,
    this.isVisible = true,
  });
}
