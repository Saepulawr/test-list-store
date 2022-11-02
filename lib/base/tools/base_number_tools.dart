import 'package:intl/intl.dart';

class BaseNumberTools {
  static String toRupiah({
    required int nominal,
    String simbol = "Rp",
    int decimalDigits = 0,
  }) {
    final formater = NumberFormat.currency(
        locale: 'id', symbol: simbol, decimalDigits: decimalDigits);
    return formater.format(nominal);
  }
}
