import 'package:flutter/material.dart';

import '../Screens/home_page.dart';
import '../Screens/parent_file.dart';

// ignore: must_be_immutable
class WorkoutsWidget extends StatelessWidget {
  int index;
  WorkoutsWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              image: index > 0
                  ? AssetImage(workouts[index]![1])
                  : AssetImage(
                      assetImage,
                    ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple[200],
        ),
        height: 150,
      ),
    );
  }
}
