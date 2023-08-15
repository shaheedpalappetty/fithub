import 'package:flutter/material.dart';
import 'package:workout_app/functions/signup_user_function.dart';
import 'package:workout_app/styles/fonts.dart';

import 'package:workout_app/widgets/wheel_tile.dart';

class WeightScreen extends StatefulWidget {
  final userDetails;
  const WeightScreen({super.key, required this.userDetails});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int SelectedWeight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            alignment: Alignment(0, -.8),
            child: Text(
              'What is Your Weight?',
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
            selectedValue: SelectedWeight,
            starts: 50,
            itemcount: 70,
            onSelectedValueChanged: SelectedValueChanged,
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
                      updateFromWeightScreen(
                          widget.userDetails, SelectedWeight, context);
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

  void SelectedValueChanged(int value) {
    setState(() {
      SelectedWeight = value + 50;
    });
  }
}
