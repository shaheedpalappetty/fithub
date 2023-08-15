import '../services/db_helper.dart';
import 'home_page.dart';

addToDataBase(
  GridValue,
) {
  String TableName = workouts[GridValue]![0] + 'Table';
  print(TableName);
  Map<String, dynamic> userWorkoutDetails = {'UserId': detailsfromDB['userId']};

  String MuscleName = workouts[GridValue]![0];
  switch (MuscleName) {
    case 'Chest':
      DatabaseHelper.instance.addToChest(userWorkoutDetails);
      break;
    case 'Biceps':
      DatabaseHelper.instance.addToBiceps(userWorkoutDetails);
      break;
    case 'Back':
      DatabaseHelper.instance.addToBack(userWorkoutDetails);
      break;
    case 'Triceps':
      DatabaseHelper.instance.addToTriceps(userWorkoutDetails);
      break;
  }
}
