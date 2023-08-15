import 'package:flutter/material.dart';

import '../Screens/details_pages/age_wheel.dart';
import '../Screens/details_pages/height_screen.dart';
import '../Screens/details_pages/level_screen.dart';
import '../Screens/details_pages/set_goal.dart';
import '../Screens/details_pages/weight_screen.dart';
import '../Screens/parent_file.dart';
import '../services/db_helper.dart';

addUserIntoDB(userDetails, SelectedChoice, context) async {
  int? userId = await DatabaseHelper.instance
      .getUserIdbyUserName(userDetails['userName']);
  userDetails[DatabaseHelper.columnGender] = SelectedChoice;

  userDetails[DatabaseHelper.columnId] = userId;

  DatabaseHelper.instance.updateUserDetails(userDetails);
  print(SelectedChoice);

  print(userDetails);
  DatabaseHelper.instance.getAllUserDetails();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return AgeWheel(
        userDetails: userDetails,
      );
    },
  ));
}

updateFromAgeWheelPage(userDetails, SelectedAge, context) {
  userDetails[DatabaseHelper.columnAge] = SelectedAge;
  DatabaseHelper.instance.updateUserDetails(userDetails);
  DatabaseHelper.instance.getAllUserDetails();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return WeightScreen(
        userDetails: userDetails,
      );
    },
  ));
}

updateFromHeightPage(userDetails, selectedHeight, context) {
  userDetails[DatabaseHelper.columnHeight] = selectedHeight;
  DatabaseHelper.instance.updateUserDetails(userDetails);
  DatabaseHelper.instance.getAllUserDetails();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return SetGoal(
        userDetails: userDetails,
      );
    },
  ));
}

updateFromWeightScreen(userDetails, SelectedWeight, context) {
  userDetails[DatabaseHelper.columnWeight] = SelectedWeight;
  DatabaseHelper.instance.updateUserDetails(userDetails);
  DatabaseHelper.instance.getAllUserDetails();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return HeightScreen(
        userDetails: userDetails,
      );
    },
  ));
}

upadateFromLevelScreen(UserDetails, selectedItem, context) {
  UserDetails[DatabaseHelper.columnActivityLevel] = selectedItem;
  UserDetails[DatabaseHelper.columnLoggedinStatus] = 1;
  DatabaseHelper.instance.updateUserDetails(UserDetails);
  DatabaseHelper.instance.getAllUserDetails();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) {
      return BottomNav(
        userDetails: UserDetails,
      );
    },
  ), (route) => false);
}

updateFromSetGoalScreen(userDetails, selectedGoal, context) {
  userDetails[DatabaseHelper.columnGoal] = selectedGoal;
  DatabaseHelper.instance.updateUserDetails(userDetails);
  DatabaseHelper.instance.getAllUserDetails();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return LevelScreen(
        UserDetails: userDetails,
      );
    },
  ));
}
