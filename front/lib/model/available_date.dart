class AvailableDate {
  final DateTime date;
  final List<DateTime> hours;

  AvailableDate(this.date, this.hours);

  static convertAvailableDate(availableDate) {
    List<DateTime> hours = [];
    for (var hour in availableDate['hours']) {
      hours.add(DateTime.parse(hour));
    }
    return AvailableDate(DateTime.parse(availableDate['date']), hours);
  }
}
