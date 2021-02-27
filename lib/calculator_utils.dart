import 'package:flutter_app/calculator.dart';

class CalculatorUtils {
  static String checkTypeOfOperation(operation) {
    switch (operation) {
      case Operation.add:
        return 'Plus';
      case Operation.subtract:
        return 'Minus';
      case Operation.multiply:
        return 'Multiplied by';
      case Operation.divide:
        return 'Divided by';
      case Operation.powerOfTwo:
        return 'Power of two operation';
      case Operation.pi:
        return 'PI operation';
      default:
        return '';
    }
  }

  static double makeOperation(double num1, double num2, Operation operation, Calculator calculator) {
    switch (operation) {
      case Operation.add:
        return calculator.add(num1, num2);
        break;
      case Operation.subtract:
        return calculator.subtract(num1, num2);
        break;
      case Operation.multiply:
        return calculator.multiply(num1, num2);
        break;
      case Operation.divide:
        return calculator.divide(num1, num2);
        break;
      default:
        return 0;
    }
  }
}
