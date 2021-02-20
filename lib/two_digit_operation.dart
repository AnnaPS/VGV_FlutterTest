import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';

class TwoDigitOperation extends StatefulWidget {
  const TwoDigitOperation({this.calculator, this.operation});
  final Calculator calculator;
  final Operation operation;

  @override
  _TwoDigitOperationState createState() => _TwoDigitOperationState();
}

class _TwoDigitOperationState extends State<TwoDigitOperation> {
  TextEditingController tc1;
  TextEditingController tc2;
  double result = -1.0;

  @override
  void initState() {
    tc1 = TextEditingController();
    tc2 = TextEditingController();
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
                checkTypeOfOperation(widget.operation),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Result',
                style: TextStyle(fontSize: 20),
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
              child: TextField(
                key: Key('textfield_top_${checkTypeOfOperation(widget.operation).toLowerCase()}'),
                controller: tc1,
                decoration: InputDecoration(
                  labelText: 'Num 1',
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: TextField(
                key: Key('textfield_bottom_${checkTypeOfOperation(widget.operation).toLowerCase()}'),
                controller: tc2,
                decoration: InputDecoration(
                  labelText: 'Num 2',
                ),
              ),
            ),
            Text(
              result == -1 ? '???' : result.toString(),
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
            key: Key('button_${checkTypeOfOperation(widget.operation).toLowerCase()}'),
            onPressed: () {
              final num1 = tc1.text != '' ? double.parse(tc1.text) : 0.0;
              final num2 = tc2.text != '' ? double.parse(tc2.text) : 0.0;
              _makeOperation(num1, num2, widget.operation);
            },
            child: Icon(Icons.check),
          ),
        )
      ],
    );
  }

  String checkTypeOfOperation(operation) {
    switch (operation) {
      case Operation.add:
        return 'Plus';
      case Operation.subtract:
        return 'Minus';
      case Operation.multiply:
        return 'Multiplied by';
      case Operation.divide:
        return 'Divided by';
      default:
        return '';
    }
  }

  _makeOperation(double num1, double num2, Operation operation) {
    switch (operation) {
      case Operation.add:
        setState(() {
          result = num1 + num2;
        });
        break;
      case Operation.subtract:
        setState(() {
          result = num1 - num2;
        });
        break;
      case Operation.multiply:
        setState(() {
          result = num1 * num2;
        });
        break;
      case Operation.divide:
        setState(() {
          if (num1 == 0 || num2 == 0) {
            result = 0.0;
          } else {
            result = num1 / num2;
          }
        });
        break;
      default:
        return 0;
    }
  }
}
