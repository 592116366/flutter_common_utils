import 'package:flutter_my_utils/src/log_util.dart';
import 'package:flutter_my_utils/src/string_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  print("1");
  // test(description, body)
  String phoneNo =
      StringUtil.addCharAtPosition("15845678910", ' ', 4, repeat: true);

  LogUtil.e(phoneNo); //1584 5678 910
  LogUtil.e("replace: " + StringUtil.replace(phoneNo, ' ', ''));
  LogUtil.e("replace: " + StringUtil.replace("123123453", '3', 'x'));
  // LogUtil.e("formatComma3: " + StringUtil.formatComma3(12345678)); //12,345,678
  LogUtil.e(
      "hideNumber: " + StringUtil.hideNumber("15845678910")); //158****8910
  LogUtil.e("isEmpty: " + StringUtil.isNullOrEmpty("").toString()); //true
  LogUtil.e("reverse: " + StringUtil.reverse("12345678")); //87654321
  // LogUtil.e("formatDigitPattern: " +
  //     StringUtil.formatDigitPattern("12345678",
  //         digit: 3, pattern: 'x')); //1x2x3x4x5x6x7x8
  // LogUtil.e("formatDigitPatternEnd: " +
  //     StringUtil.formatDigitPatternEnd("12345678",
  //         digit: 3, pattern: 'x')); //1x2x3x4x5x6x7x8
  LogUtil.e('count' +
      StringUtil.countChars('Hello my name is Jon Doe.', 'E',
              caseSensitive: false)
          .toString());
  LogUtil.e('count' +
      StringUtil.countChars('Hello my name is Jon Doe.', 'E').toString());

  test('Test isDigit', () {
    expect(StringUtil.isDigit('1'), true);
    expect(StringUtil.isDigit('12345'), true);
    expect(StringUtil.isDigit('1a356'), false);
    expect(StringUtil.isDigit('q3dm16'), false);
    expect(StringUtil.isDigit(''), false);
  });
  test('Test equalsIgnoreCase', () {
    expect(StringUtil.equalsIgnoreCase('hello', 'HELLO'), true);
  });

  test('Test inList', () {
    var list = ['a', 'b', 'c', 'A'];
    expect(StringUtil.inList('c', list), true);
    expect(StringUtil.inList('d', list), false);
    expect(StringUtil.inList('A', list, ignoreCase: true), true);
    expect(StringUtil.inList('D', list, ignoreCase: true), false);
  });

  test('Test isPalindrome', () {
    expect(StringUtil.isPalindrome('aha'), true);
    expect(StringUtil.isPalindrome('123454321'), true);
    expect(StringUtil.isPalindrome('1a356'), false);
    expect(StringUtil.isPalindrome('hello'), false);
  });

  test('Test hidePartial', () {
    expect(StringUtil.hidePartial('1234567890'), '*****67890');
    expect(
        StringUtil.hidePartial('18112344321', begin: 3, end: 7), '181****4321');
    expect(StringUtil.hidePartial('1234567890', begin: 1), '1****67890');
    expect(
        StringUtil.hidePartial('1234567890', begin: 2, end: 14), '12********');
  });

  test('Test addCharAtPosition', () {
    expect(StringUtil.addCharAtPosition('1234567890', '-', 3), '123-4567890');
    expect(StringUtil.addCharAtPosition('1234567890', '-', 3, repeat: true),
        '123-456-789-0');
    expect(StringUtil.addCharAtPosition('1234567890', '-', 12), '1234567890');
    expect(
        StringUtil.addCharAtPosition(
            '1F6254CEDA7E9E9AEBF8B687BDFB5CC03AD1B3E7', ' ', 2,
            repeat: true),
        '1F 62 54 CE DA 7E 9E 9A EB F8 B6 87 BD FB 5C C0 3A D1 B3 E7');
  });
  test('Test chunk', () {
    var chunked = StringUtil.chunk('aaaabbbbccccdddd', 3);
    LogUtil.e('element' + chunked.toString());
    // var chunked = StringUtil.chunk('aaaabbbbccccdddd', 4);
    // expect(chunked.length, 4);
    // expect(chunked.elementAt(0), 'aaaa');
    // expect(chunked.elementAt(1), 'bbbb');
    // expect(chunked.elementAt(2), 'cccc');
    // expect(chunked.elementAt(3), 'dddd');
  });
  test('Test Pick Only', () {
    expect(StringUtil.pickOnly('123456789'), '123456789');
    expect(StringUtil.pickOnly('123456789', from: 3, to: 8), '345678');
    expect(StringUtil.pickOnly('123456789', to: 5), '12345');
    expect(StringUtil.pickOnly('123456789', from: 7), '789');
  });

  test('Test Remove Character at Position', () {
    expect(StringUtil.removeCharAtPosition('flutterr', 8), 'flutter');
    expect(StringUtil.removeCharAtPosition('iintel', 1), 'intel');
    expect(StringUtil.removeCharAtPosition('strinng', 5), 'string');
    LogUtil.e(
        'element' + StringUtil.removeCharAtPosition('123456', 3).toString());
  });

  test('Test Remove Pattern', () {
    expect(StringUtil.removeExp('Hello This World', 'This'), 'Hello World');
    expect(StringUtil.removeExp('All all all', 'all'), 'All');
    expect(
        StringUtil.removeExp('All all all', 'all', repeat: false), 'All all');
    expect(
        StringUtil.removeExp('All all all', 'all', caseSensitive: false), '');

    LogUtil.e(
        'element' + StringUtil.removeExp('All all all', 'all', repeat: true));
  });

  test('Test isIP', () {
    expect(StringUtil.isIP('127.0.0.1'), true);
    expect(StringUtil.isIP('0.0.0.0'), true);
    expect(StringUtil.isIP('255.255.255.255'), true);
    expect(StringUtil.isIP('1.2.3.4'), true);
    expect(StringUtil.isIP('::1'), true);
    expect(StringUtil.isIP('2001:db8:0000:1:1:1:1:1'), true);
    expect(StringUtil.isIP('abc'), false);
    expect(StringUtil.isIP('256.0.0.0'), false);
    expect(StringUtil.isIP('0.0.0.256'), false);
    expect(StringUtil.isIP('26.0.0.256'), false);
  });
  test('Test Truncate', () {
    expect(StringUtil.truncate('This is a Dart Utility Library', 26),
        'This is a Dart Utility Lib...');
    expect(
        StringUtil.truncate('This is a Dart Utility Library', 26,
            symbol: '***'),
        'This is a Dart Utility Lib***');
  });
}
