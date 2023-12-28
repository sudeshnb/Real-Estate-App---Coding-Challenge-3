///
extension StringExtension on String {
  String firstcapital() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
