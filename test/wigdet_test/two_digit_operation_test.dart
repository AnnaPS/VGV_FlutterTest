import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'package:flutter_app/two_digit_operation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets('paints the value returned by the calculator', (tester) async {
        when(calculator.add(3, 1)).thenReturn(25);
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
