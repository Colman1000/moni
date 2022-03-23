extension Diff on DateTime {
  int daysBetween([DateTime? date]) {
    final other = date ?? DateTime.now();

    final from = DateTime(year, month, day);
    final to = DateTime(other.year, other.month, other.day);
    return (to.difference(from).inHours / 24).round();
  }

  bool isToday() {
    return isSameDayAs(DateTime.now());
  }

  bool isSameDayAs(DateTime other) {
    final current = DateTime(year, month, day);
    return current.year == other.year &&
        current.month == other.month &&
        current.day == other.day;
  }
}
