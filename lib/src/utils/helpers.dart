import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}

currencyFormatter(var input, {bool hasDecimal = false}) {
  if (input == 0 || input.toString() == '0' || input.toString() == '0.00')
    return hasDecimal ? "0.00" : "0";
  return hasDecimal
      ? NumberFormat('#,###.00').format(num.parse(input.toString()))
      : NumberFormat('#,###').format(num.parse(input.toString()));
}
