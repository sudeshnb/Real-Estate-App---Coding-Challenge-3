import 'package:timeago/timeago.dart' as timeago;

class Timeago {
  static String time(String time) {
    final timeAgo = timeago.format(DateTime.parse(time), locale: 'en');
    return timeAgo.startsWith('~') ? timeAgo.replaceAll(r'~', '') : timeAgo;
  }
}
