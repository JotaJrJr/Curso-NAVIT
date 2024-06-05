import 'package:flutter/material.dart';

import '../../layout_builder.dart';
import '../viewports/calculator_large_view_port.dart';
import '../viewports/calculator_small_view_port.dart';
import '../viewmodel/calculator_view_model.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    super.key,
  });

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late CalculatorViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CalculatorViewModel();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> maximizado = ValueNotifier<bool>(false);

    return Material(
      child: AnimatedBuilder(
        animation: _viewModel,
        builder: (_, __) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: maximizado.value ? 600 : 200,
              decoration: const BoxDecoration(
                color: Color(0xFF514C4C),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionRowButtons(
                    onClose: () {
                      Navigator.of(context).pop();
                    },
                    onMinimize: () {},
                    onMaximize: () {
                      _viewModel.changeSize(maximizado);
                    },
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _viewModel.displayText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  LayoutBuilderWidget(
                    isMaximizado: maximizado,
                    builder: (context, constraints, maximizado) {
                      if (!maximizado.value) {
                        return CalculatorSmallViewPort(viewModel: _viewModel);
                      } else {
                        return CalculatorLargeViewPort(viewModel: _viewModel);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ActionRowButtons extends StatelessWidget {
  late Function? onClose;
  late Function? onMinimize;
  late Function? onMaximize;

  ActionRowButtons({super.key, this.onClose, this.onMinimize, this.onMaximize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActionButtonWidget(
            color: Colors.red,
            text: "+",
            angle: 0.785398,
            onPressed: onClose ?? () {},
          ),
          const SizedBox(width: 8),
          ActionButtonWidget(
            color: Colors.yellow,
            text: "-",
            onPressed: onMinimize ?? () {},
          ),
          const SizedBox(width: 8),
          ActionButtonWidget(
            color: Colors.green,
            text: "+",
            onPressed: onMaximize ?? () {},
          ),
        ],
      ),
    );
  }
}

class ActionButtonWidget extends StatelessWidget {
  final Color color;

  final String text;
  final Function onPressed;
  double? angle;

  ActionButtonWidget({super.key, required this.color, required this.text, required this.onPressed, this.angle = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(angle!),
          child: GestureDetector(
            onTap: () => onPressed(),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
