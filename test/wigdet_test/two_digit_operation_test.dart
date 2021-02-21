import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'package:flutter_app/two_digit_operation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets('paints 4.0 when adding 3 and 1', (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: TwoDigitOperation(
              calculator: calculator,
              operation: Operation.add,
            ),
          ),
        ));
        await tester.enterText(find.byKey(Key('textfield_top_plus')), '3');
        await tester.enterText(find.byKey(Key('textfield_bottom_plus')), '1');
        await tester.tap(find.byKey(Key('button_plus')));

        await tester.pumpAndSettle();
        expect(find.text('4.0'), findsOneWidget);
      });
    });
  });
}
