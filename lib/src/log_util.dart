import 'package:flutter/foundation.dart';

class LogUtil {
  LogUtil._();

  static const String _defTag = 'common_utils';
  static bool _debugMode = kDebugMode; //是否是debug模式,true: log v 不输出.
  static int _maxLen = 800;
  static String _tagValue = _defTag;

  static void init({
    String tag = _defTag,
    bool isDebug = true,
    int maxLen = 800,
  }) {
    _tagValue = tag;
    _debugMode = isDebug;
    _maxLen = maxLen;
  }

  static void d(Object? object, {String? tag}) {
    if (_debugMode) {
      // _printLog('$tag d | ${object?.toString()}');
      _printLog(tag, ' d ', object);
    }
  }

  static void e(Object? object, {String? tag}) {
    _printLog(tag, ' e ', object);
  }

  static void v(Object? object, {String? tag}) {
    if (_debugMode) {
      _printLog(tag, ' v ', object);
    }
  }

  // 全部打印 颜色是黄色
  static void log(Object? object, {String? tag}) {
    if (_debugMode) {
      log(object, tag: tag);
    }
  }

  // 超过最长限制会分段打印
  static void _printLog(String? tag, String stag, Object? object) {
    String da = object?.toString() ?? 'null';
    tag = tag ?? _tagValue;
    if (da.length <= _maxLen) {
      debugPrint('$tag$stag $da');
      return;
    }
    LogUtil.d(
        '$tag$stag — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —');
    while (da.isNotEmpty) {
      if (da.length > _maxLen) {
        debugPrint('$tag$stag| ${da.substring(0, _maxLen)}');
        da = da.substring(_maxLen, da.length);
      } else {
        debugPrint('$tag$stag| $da');
        da = '';
      }
    }
    debugPrint(
        '$tag$stag — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —');
  }
}
