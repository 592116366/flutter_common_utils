import 'dart:math';

class NumUtil {
  NumUtil._();

  ///处理价格 单位分转为圆.角分
  static String convertPriceToFixed2(int price) {
    var yuan = price ~/ 100;
    var fen = price % 100;
    var fenstr = fen >= 10 ? fen.toString() : "0$fen";
    return '$yuan.$fenstr';
  }

  /// 转成这样999900->9999 9901->99.01 99910->999.1
  static String convertCustomPrice(int price) {
    //保留小数点后2位数，并返回字符串：33.33。
    double yuan = price % 100;
    return yuan.toStringAsFixed(2);
  }
}
