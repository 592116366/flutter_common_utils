import 'package:flutter_my_utils/flutter_my_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test changeF2Y', () {
    expect(MoneyUtil.changeF2Y(9990), '99.90');
    expect(MoneyUtil.changeF2Y(9990, format: MoneyFormat.END_INTEGER), '99.9');
    expect(MoneyUtil.changeF2Y(9900, format: MoneyFormat.YUAN_INTEGER), '99');
    expect(MoneyUtil.changeF2Y(9990, format: MoneyFormat.YUAN_INTEGER), '99.90');
  });
  LogUtil.e(MoneyUtil.changeF2YWithUnit(9990), tag: "f2y"); //99.90
  LogUtil.e(MoneyUtil.changeF2YWithUnit(9990, unit: MoneyUnit.YUAN), tag: "f2y"); //99.90
}
