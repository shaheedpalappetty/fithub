import 'package:flutter/material.dart';
import 'package:workout_app/functions/signup_user_function.dart';

import '../../styles/fonts.dart';

class SetGoal extends StatefulWidget {
  final userDetails;
  const SetGoal({super.key, required this.userDetails});
  @override
  _SetGoalState createState() => _SetGoalState();
}

class _SetGoalState extends State<SetGoal> {
  List<String> goals = [
    'Gain Weight',
    'Gain Muscle',
    'Loose Weight',
    'Get Fit',
  ];

  String? selectedGoal;

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'What Is Your Goal?',
              style: CustomFontStyles.title3,
            ),
            Container(
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                textAlign: TextAlign.center,
                style: CustomFontStyles.title4,
              ),
            ),
            Container(
              height: Dheight / 3.4,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return ListTile(
                    title: Text(goal),
                    trailing: (selectedGoal == goal)
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.grey,
                          ),
                    onTap: () {
                      setState(() {
                        selectedGoal = goal;
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text('Back')),
                ElevatedButton(
                    onPressed: () {
                      updateFromSetGoalScreen(
                          widget.userDetails, selectedGoal, context);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text('Continue'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
