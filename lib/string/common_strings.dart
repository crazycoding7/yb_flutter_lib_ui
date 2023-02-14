class CommonStrings {
  static const String tipNetError = '网络连接不可用，请稍后重试';

  static String shortString(String str, {int max = 10}) {
    return str.length < max ? str : '${str.substring(0, max)}...';
  }
}
