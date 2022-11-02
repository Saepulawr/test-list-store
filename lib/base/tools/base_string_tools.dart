import 'dart:collection';

class BaseStringTools {
  BaseStringTools._();

  static bool validatePasswordStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
    // result
    // Vignesh123! : true
    // vignesh123 : false
    // VIGNESH123! : false
    // vignesh@ : false
    // 12345678? : false
  }

  static bool isNullOrEmpty(dynamic x) {
    assert(
      x == null ||
          x is String ||
          x is List ||
          x is Map ||
          x is HashMap ||
          x is Set ||
          x is Object,
    );

    if (x == null) {
      return true;
    }

    if (x is String) {
      return x.isEmpty;
    }

    if (x is List) {
      return x.isEmpty;
    }

    if (x is Map) {
      return x.isEmpty;
    }

    if (x is HashMap) {
      return x.isEmpty;
    }

    if (x is Set) {
      return x.isEmpty;
    }

    if (x is Object) {
      return false;
    }
    return true;
  }

  static bool isNotNullOrEmpty(dynamic x) {
    assert(x == null ||
        x is String ||
        x is List ||
        x is Map ||
        x is HashMap ||
        x is Set);

    if (x == null) {
      return false;
    }

    if (x is String) {
      return x.isNotEmpty;
    }

    if (x is List) {
      return x.isNotEmpty;
    }

    if (x is Map) {
      return x.isNotEmpty;
    }

    if (x is HashMap) {
      return x.isNotEmpty;
    }

    if (x is Set) {
      return x.isNotEmpty;
    }

    return false;
  }

  static int extractNumber(String text) =>
      int.tryParse(text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  static String getIndonesianTimeZone() {
    final tZ = DateTime.now().timeZoneOffset;
    switch (tZ.inHours) {
      case 7:
        return "WIB";
      case 8:
        return "WITA";
      case 9:
        return "WIT";
      default:
        return "";
    }
  }
}
