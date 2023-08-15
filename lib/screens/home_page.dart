import 'package:flutter/material.dart';
import 'package:workout_app/Screens/workouts_pages/gym_workouts_grid.dart';
import 'package:workout_app/functions/calculate_bmi.dart';
import 'package:workout_app/screens/workout_screen.dart';
import '../widgets/activities_widget.dart';
import '../widgets/horizontal_card_widget.dart';
import '../widgets/workouts_widget.dart';

import 'add_tableto_db.dart';
import 'bmi_screen.dart';
import 'parent_file.dart';
import 'calorie_dashboard.dart';

Map<dynamic, dynamic> detailsfromDB = {};

final Map<int, List<String>> workouts = {
  0: ['Chest', 'assets/images/workout_images/chest.jpg'],
  1: ['Biceps', 'assets/images/workout_images/Biceps.jpg'],
  2: ['Back', 'assets/images/workout_images/back.jpg'],
  3: ['Triceps', 'assets/images/workout_images/chest.jpg'],
  4: ['Shoulder', 'assets/images/workout_images/Biceps.jpg'],
  5: ['Legs', 'assets/images/workout_images/back.jpg'],
  6: ['Chest', 'assets/images/workout_images/chest.jpg'],
  7: ['Biceps', 'assets/images/workout_images/Biceps.jpg'],
  8: ['Back', 'assets/images/workout_images/back.jpg'],
  9: ['Triceps', 'assets/images/workout_images/chest.jpg'],
  10: ['Shoulder', 'assets/images/workout_images/Biceps.jpg'],
  11: ['Legs', 'assets/images/workout_images/back.jpg'],
};
List images = [
  ['assets/images/Activities/bmi.jpg', 'BMI'],
  ['assets/images/Activities/calorie_intake.jpg', 'Calorie Dashboard'],
];

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final todaysRecommendation;
  final userDetails;
  Home(
      {super.key,
      required this.userDetails,
      required this.todaysRecommendation});

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;
    detailsfromDB = userDetails;
    double bmiValue = calculatebmi(userDetails);
    //function to the recommendation

    List<List<dynamic>> recomendedWorkouts =
        recommendation(todaysRecommendation);

    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(
          Dheight / 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back !\n${userDetails!['userName']}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dheight / 32.4,
            ),
            Text(
              'Today\'s Workout',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dheight / 32.4,
            ),
            GestureDetector(
                onTap: () {
                  int woroutIndex = findIndex();
                  addToDataBase(woroutIndex);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return GymWorkouts(
                        mapindex: workouts[woroutIndex]![0],
                      );
                    },
                  ));
                },
                child: WorkoutsWidget(
                  index: 0,
                )),
            SizedBox(
              height: Dheight / 32.4,
            ),
            Text(
              'All Workout',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dheight / 32.4,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return WorkoutsScreen();
                    },
                  ));
                },
                child: WorkoutsWidget(
                  index: 3,
                )),
            SizedBox(
              height: Dheight / 32.4,
            ),
            Text(
              'Recommendations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dheight / 32.4,
            ),
            Container(
              height: Dheight / 5.4,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: recomendedWorkouts.length,
                itemBuilder: (context, index) {
                  return HorizontalCard(
                    recomendedWorkouts: recomendedWorkouts,
                    workoutindex: index,
                    // title: remainingKeys[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: Dheight / 32.4,
            ),
            Text(
              'Activities',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dheight / 40.5,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return BMIDetailsScreen(bmiValue: bmiValue);
                        },
                      ));
                    },
                    child: ActivitiesWidget(
                        image: images[0][0], title: images[0][1])),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return CalorieDashboard();
                        },
                      ));
                    },
                    child: ActivitiesWidget(
                        image: images[1][0], title: images[1][1])),
              ],
            ),
            SizedBox(
              height: Dheight / 40.5,
            ),
          ],
        ),
      ),
    ));
  }
}

List<List<dynamic>> recommendation(Map<String, dynamic> todaysRecommendation) {
  List<String> keysToRemove = [tableName, 'UserId', 'Id', 'Date', 'Total'];

  Map<String, dynamic> mutableRecommendation = Map.from(todaysRecommendation);

  for (String key in keysToRemove) {
    mutableRecommendation.remove(key);
  }

  List<String> remainingKeys = mutableRecommendation.keys.toList();
  print('remainingKeys');
  print(remainingKeys);

  List<dynamic> remainingValues = mutableRecommendation.values.toList();
  print('remainingValues');
  print(remainingValues);

  List<List<dynamic>> recomdationList = [];
  for (int i = 0; i < remainingKeys.length; i++) {
    recomdationList.add([remainingKeys[i], remainingValues[i]]);
  }
  print(recomdationList);
  return recomdationList;
}

findIndex() {
  int recomendedWorkoutIndex = -1;
  String new_table_name = tableName.replaceAll("Table", "");
  print('new_table_name');
  print(new_table_name);
  switch (new_table_name) {
    case 'Chest':
      recomendedWorkoutIndex = 0;
      break;
    case 'Biceps':
      recomendedWorkoutIndex = 1;
      break;
    case 'Back':
      recomendedWorkoutIndex = 2;
      break;
    case 'Triceps':
      recomendedWorkoutIndex = 3;
      break;
  }
  return recomendedWorkoutIndex;
}
