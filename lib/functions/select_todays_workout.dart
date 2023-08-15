import 'package:intl/intl.dart';

import '../Screens/home_page.dart';
import '../Screens/parent_file.dart';

List<String> todaysWorkout() {
  DateTime today = DateTime.now(); // Get the current date and time

  String dayName =
      DateFormat('EEEE').format(today); // Get the name of the current day

  String assetImage = workouts[0]![1]; // Define the default AssetImage
  switch (dayName) {
    case 'Monday':
      assetImage = workouts[0]![1];
      tableName = 'ChestTable';
      break;
    case 'Tuesday':
      assetImage = workouts[1]![1];
      tableName = 'BicepsTable';
      break;
    case 'Wednesday':
      assetImage = workouts[2]![1];
      tableName = 'BackTable';
      break;
    case 'Thursday':
      assetImage = workouts[3]![1];
      tableName = 'TricepsTable';
      break;
    case 'Friday':
      assetImage = workouts[4]![1];
      tableName = 'ChestTable';
      break;
    case 'Saturday':
      assetImage = workouts[5]![1];
      tableName = 'BicepsTable';
      break;
    default:
      assetImage = workouts[0]![1];
      tableName = 'BackTable';
  }
  print('tableName inside switch case $tableName');
  List<String> res = [assetImage, tableName];
  return res;
}
