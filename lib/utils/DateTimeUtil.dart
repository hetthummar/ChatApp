import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTime parseServerDateTime(String dateTime) {
    return DateTime.parse(dateTime);
  }

  String formateDateTime(DateTime incomingDateTime) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(incomingDateTime);
    return formattedDate;
  }
}
