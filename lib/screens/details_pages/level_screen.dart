import 'package:flutter/material.dart';
import 'package:workout_app/functions/signup_user_function.dart';

import 'package:workout_app/styles/fonts.dart';

class LevelScreen extends StatefulWidget {
  final UserDetails;
  LevelScreen({super.key, required this.UserDetails});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  List<String> setlevel = ['Beginner', 'Intermediate', 'Advanced'];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Physical Activity Level?',
                    style: CustomFontStyles.title3,
                  ),
                  SizedBox(
                    height: Dheight / 27,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    textAlign: TextAlign.center,
                    style: CustomFontStyles.title4,
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedItem == index
                                  ? Colors.deepPurple
                                  : Colors.grey[900],
                              borderRadius: BorderRadius.circular(20)),
                          height: Dheight / 13.5,
                          margin: EdgeInsets.symmetric(
                              horizontal: Dheight / 81, vertical: Dheight / 81),
                          child: Center(
                            child: Text(
                              setlevel[index],
                              style: CustomFontStyles.title4,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            Expanded(
                child: Container(
              alignment: Alignment(0, -.5),
              child: Row(
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
                        upadateFromLevelScreen(
                            widget.UserDetails, selectedItem, context);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text('Continue'))
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
