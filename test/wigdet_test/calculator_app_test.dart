import 'package:flutter/material.dart';
import 'package:flutter_app/calculatorapp.dart';
import 'package:flutter_app/two_digit_operation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorApp', () {
    testWidgets('renders four widgets of type TwoDigitOperation', (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('shows result when given two numbers', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      // enter number 1
      await tester.enterText(find.byKey(Key('textfield_top_plus')), '3');
      // enter number 2
      await tester.enterText(find.byKey(Key('textfield_bottom_plus')), '6');
      // click on FAB
      await tester.tap(find.byKey(Key('button_plus')));
      // Repaint the view
      await tester.pumpAndSettle();
      // Result
      expect(find.text('9.0'), findsOneWidget);
    });
  });

  group('minus', () {
    testWidgets('shows result when given two numbers', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      await tester.enterText(find.byKey(Key('textfield_top_minus')), '6');
      await tester.enterText(find.byKey(Key('textfield_bottom_minus')), '3');
      await tester.tap(find.byKey(Key('button_minus')));
      await tester.pumpAndSettle();
      expect(find.text('3.0'), findsOneWidget);
    });
  });
}
