// Pure grouping logic for the Month -> Day availability picker. The backend
// only returns a flat list of available dates for a doctor (no dedicated
// month/day endpoints), so this derives the calendar hierarchy from that
// single list rather than guessing at data the backend doesn't provide.

class AvailabilityMonth {
  final int year;
  final int month;
  final bool hasAvailability;

  const AvailabilityMonth({
    required this.year,
    required this.month,
    required this.hasAvailability,
  });

  DateTime get asDate => DateTime(year, month);
}

class AvailabilityDay {
  final DateTime date;
  final bool hasAvailability;

  const AvailabilityDay({required this.date, required this.hasAvailability});
}

/// Every month from the earliest to the latest available date (inclusive),
/// flagging which ones actually have a slot so a gap month can still be
/// shown, disabled, instead of silently skipped.
List<AvailabilityMonth> buildAvailableMonths(List<DateTime> availableDates) {
  if (availableDates.isEmpty) return [];

  final sorted = [...availableDates]..sort();
  final availableMonthKeys = sorted.map((d) => (d.year, d.month)).toSet();

  final months = <AvailabilityMonth>[];
  var cursor = DateTime(sorted.first.year, sorted.first.month);
  final end = DateTime(sorted.last.year, sorted.last.month);
  while (!cursor.isAfter(end)) {
    months.add(
      AvailabilityMonth(
        year: cursor.year,
        month: cursor.month,
        hasAvailability: availableMonthKeys.contains((
          cursor.year,
          cursor.month,
        )),
      ),
    );
    cursor = DateTime(cursor.year, cursor.month + 1);
  }
  return months;
}

/// Every day in the given month (from today onward if it's the current
/// month, since past days can never have availability), flagging which
/// ones actually have a slot.
List<AvailabilityDay> buildDaysForMonth({
  required int year,
  required int month,
  required List<DateTime> availableDates,
  List<DateTime> alreadyBookedDates = const [],
}) {
  final availableDayNumbers = availableDates
      .where((d) => d.year == year && d.month == month)
      .map((d) => d.day)
      .toSet();
  // the backend allows only one appointment per doctor per day, so a day
  // already booked with this doctor can never succeed even if slots on it
  // still show as open - excluded here rather than letting the user hit
  // that error after picking a time
  final alreadyBookedDayNumbers = alreadyBookedDates
      .where((d) => d.year == year && d.month == month)
      .map((d) => d.day)
      .toSet();

  final daysInMonth = DateTime(year, month + 1, 0).day;
  final today = DateTime.now();
  final isCurrentMonth = today.year == year && today.month == month;
  final startDay = isCurrentMonth ? today.day : 1;

  return [
    for (var day = startDay; day <= daysInMonth; day++)
      AvailabilityDay(
        date: DateTime(year, month, day),
        hasAvailability:
            availableDayNumbers.contains(day) &&
            !alreadyBookedDayNumbers.contains(day),
      ),
  ];
}
