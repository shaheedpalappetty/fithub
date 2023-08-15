import 'package:flutter/material.dart';

import 'package:workout_app/styles/fonts.dart';

import '../../functions/signup_user_function.dart';
import '../../widgets/wheel_tile.dart';

class AgeWheel extends StatefulWidget {
  final userDetails;
  AgeWheel({super.key, required this.userDetails});

  @override
  State<AgeWheel> createState() => _AgeWheelState();
}

class _AgeWheelState extends State<AgeWheel> {
  int SelectedAge = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            alignment: Alignment(0, -.8),
            child: Text(
              'How Old Are You?',
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
              starts: 15,
              selectedValue: SelectedAge,
              itemcount: 45,
              onSelectedValueChanged: selectedValueChanged),
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
                      updateFromAgeWheelPage(
                          widget.userDetails, SelectedAge, context);
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
      SelectedAge = value + 15;
    });
  }
}
