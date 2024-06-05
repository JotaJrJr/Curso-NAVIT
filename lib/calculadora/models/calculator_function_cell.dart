import 'package:flutter/material.dart';

import 'calculator_cell.dart';
import '../viewmodel/calculator_view_model.dart';

class CalculatorFunctionCell extends CalculatorCell {
  final Function(CalculatorViewModel) onPressed;
  CalculatorFunctionCell({required String text, required Color color, required this.onPressed}) : super(text: text, color: color);
}
