import 'package:flutter/material.dart';
import 'package:workout_app/screens/workout_screen.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 6,
      itemBuilder: (context, index) {
        return WorkoutsGrid(
          GridValue: index,
        );
      },
    );
  }
}
