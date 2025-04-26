import 'package:intl/intl.dart';

class Formatter {

  static String formatChatDate(String isoDate) {
    DateTime? dateTime = DateTime.tryParse(isoDate);

    if (dateTime == null) return "";

    DateTime localDate = dateTime.toLocal();

    bool isToday = localDate.day == DateTime.now().day;

    if(isToday) {
      return DateFormat("hh:mm aa").format(localDate);
    } else {
      return DateFormat("dd/MM/yyyy").format(localDate);
    }

  }

  static String formatDate(String isoDate) {
    DateTime? dateTime = DateTime.tryParse(isoDate);

    if (dateTime == null) return "";

    DateTime localDate = dateTime.toLocal();
    return DateFormat("dd/MM/yyyy").format(localDate);
  }

  static String formatTime(String isoDate) {
    DateTime? dateTime = DateTime.tryParse(isoDate);

    if (dateTime == null) return "";

    DateTime localDate = dateTime.toLocal();
    return DateFormat("hh:mm aa").format(localDate);
  }
}
