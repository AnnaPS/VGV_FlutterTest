import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';

class PowerOfTwo extends StatefulWidget {
  const PowerOfTwo({
    Key key,
    @required Calculator calculator,
  })  : assert(calculator != null),
        _calculator = calculator,
        super(key: key);

  final Calculator _calculator;

  @override
  State<StatefulWidget> createState() => _PowerOfTwoState();
}

class _PowerOfTwoState extends State<PowerOfTwo> {
  final _controller = TextEditingController();

  double _result = -1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_getResult);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'to the power of two',
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
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  key: const Key('textField_powerOfTwo'),
                  controller: _controller,
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  _result == -1 ? '0' : _result.toString(),
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _getResult() async {
    try {
      final input = double.tryParse(_controller.text);
      final powerOfTwoResult = await widget._calculator.powerOfTwo(input);
      setState(() {
        _result = powerOfTwoResult;
      });
    } catch (_) {
      setState(() {
        _result = null;
      });
    }
  }
}
