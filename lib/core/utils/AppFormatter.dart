import 'package:intl/intl.dart';

class AppFormatter {
  static String formatNumber(double num) {
    NumberFormat numberFormat = NumberFormat.decimalPattern('en');
    return numberFormat.format(num);
  }
}
