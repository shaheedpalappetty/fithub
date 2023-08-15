import 'package:flutter/material.dart';
import 'package:workout_app/screens/home_page.dart';

// ignore: must_be_immutable
class HorizontalCard extends StatelessWidget {
  int workoutindex;
  List<List<dynamic>> recomendedWorkouts;

  // String title;
  HorizontalCard(
      {super.key, required this.workoutindex, required this.recomendedWorkouts
      //  required this.title
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              image: AssetImage(workouts[workoutindex]![1]),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple[200],
        ),
        child: Align(
            alignment: Alignment(.8, .8),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: recomendedWorkouts[workoutindex][1] > 0
                  ? Colors.green
                  : Colors.grey,
              child: Icon(Icons.check_rounded),
            )),
      ),
    );
  }
}
