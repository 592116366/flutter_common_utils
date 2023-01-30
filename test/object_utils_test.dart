import 'package:flutter_my_utils/src/log_util.dart';
import 'package:flutter_my_utils/src/object_util.dart';

void main() {
  LogUtil.e("---------------- ObjectUtil st ----------------");
  List<String> listA = ["A", "B", "C"];
  List<String> listB = ["A", "B", "C"];
  LogUtil.e("Two List Is Equal: " +
      ObjectUtil.twoListIsEqual(listA, listB).toString());
  LogUtil.e("---------------- ObjectUtil en ----------------\n");
}
