import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_utils/flutter_utils.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    print(calculator.addOne(1));
    expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}