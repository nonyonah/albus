import 'Package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'dd/mm/yyyy';

extension DateTimeExtension on DateTime {
  String format({
    String pattern = dateTimeFormatPattern,
    String? locale
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    } 
    return DateFormat(pattern,locale).format(this);
  }
}