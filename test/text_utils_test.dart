import 'package:flutter_my_utils/src/log_util.dart';
import 'package:flutter_my_utils/src/text_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  print("1");
  // test(description, body)
  String phoneNo = TextUtil.formatSpace4("15845678910");

  LogUtil.e(phoneNo); //1584 5678 910
  LogUtil.e("replace: " + TextUtil.replace(phoneNo, ' ', ''));
  LogUtil.e("replace: " + TextUtil.replace("123123453", '3', 'x'));
  LogUtil.e("formatComma3: " + TextUtil.formatComma3(12345678)); //12,345,678
  LogUtil.e("hideNumber: " + TextUtil.hideNumber("15845678910")); //158****8910
  LogUtil.e("isEmpty: " + TextUtil.isEmpty("").toString()); //true
  LogUtil.e("reverse: " + TextUtil.reverse("12345678")); //87654321
  LogUtil.e("formatDigitPattern: " +
      TextUtil.formatDigitPattern("12345678",
          digit: 3, pattern: 'x')); //1x2x3x4x5x6x7x8
  LogUtil.e("formatDigitPatternEnd: " +
      TextUtil.formatDigitPatternEnd("12345678",
          digit: 3, pattern: 'x')); //1x2x3x4x5x6x7x8
}
