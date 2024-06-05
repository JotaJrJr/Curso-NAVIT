// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints, ValueNotifier<bool> maximizado) builder;
  late ValueNotifier<bool>? isMaximizado;
  // context, constraints, maximizado

  LayoutBuilderWidget({
    Key? key,
    required this.builder,
    this.isMaximizado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var maximizado = ValueNotifier<bool>(false);
    isMaximizado ??= ValueNotifier<bool>(false);

    return AnimatedBuilder(
        animation: isMaximizado!,
        builder: (_, __) {
          return LayoutBuilder(builder: (context, constraints) {
            return builder(context, constraints, isMaximizado!);
          });
        });
  }
}
