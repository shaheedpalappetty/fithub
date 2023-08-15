import 'package:intl/intl.dart';

List<String> getLast7DaysDates() {
  List<String> dates = [];

  for (int i = 0; i <= 6; i++) {
    DateTime currentDate = DateTime.now().subtract(Duration(days: i));
    String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
    dates.add(formattedDate);
  }

  return dates;
}
