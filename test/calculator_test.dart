import 'package:flutter_app/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  Calculator calculator;
  setUpAll(() => print('Runs BEFORE any test is executed'));
  setUp(() {
    // 1st step: setup => create the calculator object
    calculator = Calculator();
    print('Runs BEFORE EVERY test is executed');
  });
  tearDown(() => print('Runs AFTER EVERY test is executed'));
  tearDownAll(() => print('Runs AFTER ALL test is executed'));

  test('Calculator creates a non null object', () {
    expect(Calculator(), isNotNull);
  });

  test('the calculator returns an double number when adding 2 and 2', () {
    final result = calculator.add(2, 2);
    expect(result, isA<double>(), reason: 'It should be a double number');
  });

  group('add', () {
    test('the calculator returns 4 when adding 2 and 2', () {
      // 2nd step: side effects => collect the result you want to test
      final result = calculator.add(2, 2);
      // 3rd step: expectations => compare the result against an expected value
      expect(result, 4.000, reason: 'It should be exactly 4');
    });

    test('the calculator returns 40 when adding 20 and 20', () {
      final result = calculator.add(20, 20);
      expect(result, 40, reason: 'It should be exactly 40');
    });
  });

  group('subtract', () {
    test('the calculator returns 4 when subtract 8 and 4', () {
      final result = calculator.subtract(8, 4);
      expect(result, 4, reason: 'It should be exactly 4');
    });

    test('the calculator returns -4 when subtract 4 and 8', () {
      final result = calculator.subtract(4, 8);
      expect(result, -4, reason: 'It should be exactly -4');
    });
  });

  group('multiply', () {
    test('the calculator returns 16 when multiply 8 and 2', () {
      final result = calculator.multiply(8, 2);
      expect(result, 16, reason: 'It should be exactly 16');
    });

    test('the calculator returns 50 when multiply 5 and 10', () {
      final result = calculator.multiply(5, 10);
      expect(result, 50, reason: 'It should be exactly 50');
    });
  });

  group('divide', () {
    test('the calculator returns 2 when divide 4 and 2', () {
      expect(calculator.divide(4, 2), 2, reason: 'It should be exactly 2');
    });

    test('the calculator throws an ArgumentError when dividing by zero', () {
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });
  });
}
