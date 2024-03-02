import 'package:intl/intl.dart';

class CustomFormatters {
  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'en_PH',
      symbol: '₱',
      decimalDigits: 2,
    ).format(amount);
  }

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatMobileNumber(String mobileNumber) {
    return mobileNumber.replaceFirstMapped(RegExp(r'^(\d{4})(\d{3})(\d{4})$'), (match) {
      return '${match.group(1)}-${match.group(2)}-${match.group(3)}';
    });
  }
}