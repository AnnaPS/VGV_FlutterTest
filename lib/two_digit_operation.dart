import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'package:flutter_app/calculator_utils.dart';

class TwoDigitOperation extends StatefulWidget {
  const TwoDigitOperation({this.calculator, this.operation});
  final Calculator calculator;
  final Operation operation;

  @override
  _TwoDigitOperationState createState() => _TwoDigitOperationState();
}

class _TwoDigitOperationState extends State<TwoDigitOperation> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  ValueKey textFieldTopKey;
  ValueKey textFieldBottomKey;
  ValueKey buttonKey;
  double result = -1.0;

  @override
  void initState() {
    textFieldTopKey = Key('textfield_top_${CalculatorUtils.checkTypeOfOperation(widget.operation).toLowerCase()}');
    textFieldBottomKey = Key('textfield_bottom_${CalculatorUtils.checkTypeOfOperation(widget.operation).toLowerCase()}');
    buttonKey = Key('button_${CalculatorUtils.checkTypeOfOperation(widget.operation).toLowerCase()}');
    super.initState();
  }

  @override
  void dispose() {
    tc1.dispose();
    tc2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                CalculatorUtils.checkTypeOfOperation(widget.operation),
                style: TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
              Text(
                'Result',
                style: TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              child: TextFormField(
                key: textFieldTopKey,
                keyboardType: TextInputType.number,
                controller: tc1,
                decoration: InputDecoration(
                  labelText: 'Num 1',
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: TextField(
                key: textFieldBottomKey,
                keyboardType: TextInputType.number,
                controller: tc2,
                decoration: InputDecoration(
                  labelText: 'Num 2',
                ),
              ),
            ),
            Text(
              result == -1 ? '???' : result.toString(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: FloatingActionButton(
            key: buttonKey,
            onPressed: () {
              final num1 = tc1.text != '' ? double.parse(tc1.text) : 0.0;
              final num2 = tc2.text != '' ? double.parse(tc2.text) : 0.0;
              setState(() {
                result = CalculatorUtils.makeOperation(num1, num2, widget.operation, widget.calculator);
              });
            },
            child: Icon(Icons.check),
          ),
        )
      ],
    );
  }
}
