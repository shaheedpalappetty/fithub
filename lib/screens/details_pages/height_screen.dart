import 'package:flutter/material.dart';

import 'package:workout_app/styles/fonts.dart';

import 'package:workout_app/widgets/wheel_tile.dart';

import '../../functions/signup_user_function.dart';

class HeightScreen extends StatefulWidget {
  final userDetails;
  const HeightScreen({super.key, required this.userDetails});

  @override
  State<HeightScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HeightScreen> {
  int selectedHeight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            alignment: Alignment(0, -.8),
            child: Text(
              'What is Your Height?',
              style: CustomFontStyles.title3,
            ),
          ),
          Container(
            alignment: Alignment(0, -.6),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
              textAlign: TextAlign.center,
              style: CustomFontStyles.title4,
            ),
          ),
          WheelTile(
            selectedValue: selectedHeight,
            starts: 145,
            itemcount: 42,
            onSelectedValueChanged: selectedValueChanged,
          ),
          Container(
            alignment: Alignment(0, .8),
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
                      updateFromHeightPage(
                          widget.userDetails, selectedHeight, context);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text('Continue'))
              ],
            ),
          )
        ]),
      ),
    );
  }

  void selectedValueChanged(int value) {
    setState(() {
      selectedHeight = value + 145;
    });
  }
}
