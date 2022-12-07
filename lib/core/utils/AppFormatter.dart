import 'package:intl/intl.dart';

class AppFormatter {
  static String formatNumber(double num) {
    NumberFormat numberFormat = NumberFormat.decimalPattern("en_US");
    return numberFormat.format(num);
  }

  static String formatCurrencyUSD(double num) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "en_US", name: "USD", decimalDigits: 2);
    return numberFormat.format(num);
  }

  static String formatCurrencyINR(double num) {
    NumberFormat numberFormat = NumberFormat.currency(
      name: "INR",
      locale: 'hi',
      decimalDigits: 2, // change it to get decimal places
      symbol: "₹",
    );
    return numberFormat.format(num);
  }

  static String formatCurrency(double num) {
    NumberFormat numberFormat = NumberFormat.currency(
      decimalDigits: 2,
      symbol: '',// change it to get decimal places
    );
    return numberFormat.format(num);
  }

}
