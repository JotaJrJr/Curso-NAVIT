import 'dart:ui';

import 'package:flutter/material.dart';

import '../calculadora/view/calculator.dart';

class DraggableMultiApp extends StatefulWidget {
  const DraggableMultiApp({super.key});

  @override
  State<DraggableMultiApp> createState() => _DraggableMultiAppState();
}

class _DraggableMultiAppState extends State<DraggableMultiApp> {
  late DraggableMultiAppViewModel _viewModel;

  @override
  initState() {
    super.initState();
    _viewModel = DraggableMultiAppViewModel();
  }

  Offset position = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (_, __) {
          return Stack(
            children: [
              ..._viewModel.widgets.asMap().entries.map((item) {
                int index = item.key;
                DraggableWidget widget = item.value;

                if (!item.value.isVisible) return Container();

                return Visibility(
                  visible: widget.isVisible,
                  child: Positioned(
                    left: widget.position.dx,
                    top: widget.position.dy,
                    child: GestureDetector(
                      onLongPress: () {
                        _viewModel.bringToFront(index);
                      },
                      child: Draggable(
                        data: widget.position,
                        feedback: Material(
                          child: widget.widget,
                        ),
                        childWhenDragging: Container(),
                        child: widget.widget,
                        onDragEnd: (details) {
                          setState(
                            () {
                              widget.position = details.offset;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),

              // ..._viewModel.widgets.map((item,inde) {
              //   return Visibility(
              //     visible: _viewModel.widgets[item].isVisible,
              //     child: Positioned(
              //       left: _viewModel.widgets[i].position.dx,
              //       top: _viewModel.widgets[i].position.dy,
              //       child: GestureDetector(
              //         onLongPress: () {
              //           _viewModel.bringToFront(i);
              //         },
              //         child: Draggable(
              //           data: _viewModel.widgets[i].position,
              //           feedback: Material(
              //             child: _viewModel.widgets[i].widget,
              //           ),
              //           childWhenDragging: Container(),
              //           child: _viewModel.widgets[i].widget,
              //           onDragEnd: (details) {
              //             setState(
              //               () {
              //                 _viewModel.widgets[i].position = details.offset;
              //               },
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //   );
              // }),

              // for (int i = 0; i < _viewModel.widgets.length; i++)
              //   if (_viewModel.widgets[i].isVisible)
              //     Visibility(
              //       visible: _viewModel.widgets[i].isVisible,
              //       child: Positioned(
              //         left: _viewModel.widgets[i].position.dx,
              //         top: _viewModel.widgets[i].position.dy,
              //         child: GestureDetector(
              //           onLongPress: () {
              //             _viewModel.bringToFront(i);
              //           },
              //           child: Draggable(
              //             data: _viewModel.widgets[i].position,
              //             feedback: Material(
              //               child: _viewModel.widgets[i].widget,
              //             ),
              //             childWhenDragging: Container(),
              //             child: _viewModel.widgets[i].widget,
              //             onDragEnd: (details) {
              //               setState(
              //                 () {
              //                   _viewModel.widgets[i].position = details.offset;
              //                 },
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ),
              Column(
                children: [
                  const Spacer(),
                  Align(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.grey,
                                width: 0.3,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                child: const Text("Calculator"),
                                onPressed: () {
                                  _viewModel.toggleWidgetVisibility(0);
                                },
                              ),
                              TextButton(
                                child: const Text("Segunda Calculator"),
                                onPressed: () {
                                  _viewModel.toggleWidgetVisibility(1);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0)
                ],
              ),
            ],

            // children: [
            //   Positioned(
            //     left: position.dx,
            //     top: position.dy,
            //     child: Draggable(
            //       data: position,
            //       feedback: const Calculator(),
            //       childWhenDragging: Container(),
            //       child: const Calculator(),
            //       onDragEnd: (details) {
            //         setState(() {
            //           position = details.offset;
            //         });
            //       },
            //     ),
            //   )
            // ],
          );
        },
      ),
    );
  }
}

class DraggableMultiAppViewModel extends ChangeNotifier {
  DraggableMultiAppViewModel() {
    debugPrint(
      "Widgets: ${widgets.map((e) => e.index)}",
    );
  }

  List<Widget> apps = [];

  List<DraggableWidget> widgets = [
    DraggableWidget(
      widget: const Calculator(),
      position: const Offset(10, 10),
      index: 1,
    ),
    // DraggableWidget(
    //   widget: const OutroWidgetMuitoFoda(),
    //   position: const Offset(100, 100),
    // ),
    DraggableWidget(
      widget: const Calculator(),
      position: const Offset(100, 100),
      index: 2,
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

    debugPrint(
      "Widgets: ${widgets.map((e) => e.index)}",
    );
  }
}

class DraggableWidget {
  final Widget widget;
  Offset position;
  bool isVisible;
  int index;

  DraggableWidget({
    required this.widget,
    required this.position,
    this.isVisible = true,
    required this.index,
  });
}

class OutroWidgetMuitoFoda extends StatelessWidget {
  const OutroWidgetMuitoFoda({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}
