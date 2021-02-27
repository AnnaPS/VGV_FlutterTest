import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'package:flutter_app/pi.dart';
import 'package:flutter_app/power_of_two.dart';
import 'package:flutter_app/two_digit_operation.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      title: 'Flutter VGV testing course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TwoDigitOperation(calculator: calculator, operation: Operation.add),
                TwoDigitOperation(calculator: calculator, operation: Operation.subtract),
                TwoDigitOperation(calculator: calculator, operation: Operation.multiply),
                TwoDigitOperation(calculator: calculator, operation: Operation.divide),
                PowerOfTwo(calculator: calculator),
                Pi(calculator: calculator),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
