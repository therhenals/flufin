class Utils {
  static double calculateAspectRatio(String aspectRatio) {
    if (aspectRatio.isEmpty) return 0;
    final separatorIndex = aspectRatio.indexOf(':');
    final firstValue = double.parse(aspectRatio.substring(0, separatorIndex));
    final secondValue = double.parse(
        aspectRatio.substring(separatorIndex + 1, aspectRatio.length));
    return firstValue / secondValue;
  }

  static double checkDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.parse(value);
    } else {
      return value;
    }
  }

  static String listToString(List<String?> strings) {
    String res = '';
    for (final string in strings) {
      if (string != null) {
        res += string + ', ';
      }
    }
    return res.substring(0, res.length - 2);
  }
}
