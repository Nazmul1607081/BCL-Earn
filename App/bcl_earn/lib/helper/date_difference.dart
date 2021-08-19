class DateDifference {
  int days(DateTime dateTime) {
    if (dateTime.year == DateTime.now().year) {
      if (dateTime.month == DateTime.now().month) {
        return DateTime.now().day - dateTime.day;
      } else {
        return 100;
      }
    } else {
      return 100;
    }
  }
}
