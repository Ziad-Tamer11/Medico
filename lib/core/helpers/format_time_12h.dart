import 'package:intl/intl.dart';

// Converts a backend "HH:mm" 24-hour time string into a compact 12-hour
// form, e.g. "09:30" -> "09:30am".
String formatTime12h(String time24) {
  final parsed = DateFormat('HH:mm').parse(time24);
  return DateFormat('hh:mm a').format(parsed).toLowerCase().replaceAll(' ', '');
}
