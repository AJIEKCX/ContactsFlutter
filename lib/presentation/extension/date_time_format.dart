import 'package:intl/intl.dart';

final DateFormat ddMMYyyy = DateFormat('dd.MM.yyyy');

extension DateTimeFormat on DateTime {
  String format(DateFormat dateFormat) {
    return dateFormat.format(this);
  }
}
