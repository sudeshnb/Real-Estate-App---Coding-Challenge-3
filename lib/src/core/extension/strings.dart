///
extension StringExtension on String {
  String firstcapital() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String at() {
    return "@$this";
  }

  // String date() {
  //   return DateFormat('d MMM y').format(DateTime.parse(this));
  // }

  // String time() {
  //   return DateFormat('Hms').format(DateTime.parse(this));
  // }
  // String time() {
  //   return DateFormat('Hm').format(DateTime.parse(this));
  // }

  // String seconds() {
  //   return DateFormat('s').format(DateTime.parse(this));
  // }

  String capitalize() {
    if (isEmpty) return '';
    final split = replaceAll(RegExp(r'\s+'), ' #').split(' ');
    String result = split.reduce((a, b) {
      if (b.startsWith('#')) {
        if (b.length > 1) {
          return a + b.replaceRange(0, 2, ' ${b[1].toUpperCase()}');
        } else {
          return a + b.replaceRange(0, 1, '');
        }
      }
      return '$a $b';
    });

    return result.replaceRange(0, 1, result[0].toUpperCase());
  }

  String firstName() {
    if (isNotEmpty && !startsWith(' ')) {
      var parts = firstcapital().split(' ');
      // var last = parts.sublist(1).join(' ').trim();
      // return nameWithString(prefix, last);
      return parts[0].trim();
    }
    return '';
  }

  String divide() {
    if (isNotEmpty && !startsWith(' ')) {
      var parts = firstcapital().split(' ');
      var prefix = parts[0].trim();
      var last = parts.sublist(1).join(' ').trim();
      return nameWithString(prefix, last);
    }
    return '';
  }

  String nameWithString(String prefix, String last) {
    if (prefix.isNotEmpty && last.isNotEmpty) {
      return '${prefix[0]} ${last[0]}';
    }
    if (prefix.isNotEmpty && last.isEmpty) {
      return prefix[0];
    }
    return '';
  }
}
