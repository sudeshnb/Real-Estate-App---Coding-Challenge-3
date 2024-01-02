import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class Timeago {
  static String time(String time) {
    final timeAgo = timeago.format(DateTime.parse(time), locale: 'en');
    return timeAgo.startsWith('~') ? timeAgo.replaceAll(r'~', '') : timeAgo;
  }

  static String date(String value) {
    return DateFormat.yMMMd().format(DateTime.parse(value));
  }
}
