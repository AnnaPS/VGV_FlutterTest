import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';

class Pi extends StatelessWidget {
  Pi({Key key, @required Calculator calculator})
      : assert(calculator != null),
        _calculator = calculator,
        super(key: key);

  final Calculator _calculator;
  String _result;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: _calculator.pi(),
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          _result = snapshot.data.toString();
        }
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _result != null ? 'The latest known value of pi is $_result' : 'Calculating pi...',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        );
      },
    );
  }
}
