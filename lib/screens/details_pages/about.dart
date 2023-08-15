import 'package:flutter/material.dart';
import 'package:workout_app/functions/signup_user_function.dart';

import 'package:workout_app/styles/fonts.dart';

import '../../widgets/custum_choice_chips.dart';

// ignore: must_be_immutable
class About extends StatefulWidget {
  Map<String, dynamic> userDetails;
  About({super.key, required this.userDetails});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String SelectedChoice = '';

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;
    double Dwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Dheight * 0.032,
          ),
          Text('Tell Us About Yourself',
              textAlign: TextAlign.center, style: CustomFontStyles.title2),
          Text(
            'To give you a better experience and results we need to know your gender',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: Dheight * 0.032,
          ),
          CustomChoiceChips(
            choices: {'Male': Icons.male, 'Female': Icons.female},
            selectedChoice: SelectedChoice,
            onSelected: (gender) {
              setState(() {
                SelectedChoice = gender;
              });
            },
          ),
          SizedBox(
            height: Dheight * 0.033,
          ),
          SizedBox(
            width: Dwidth * .7,
            height: Dheight * 0.057,
            child: ElevatedButton(
              onPressed: () {
                addUserIntoDB(widget.userDetails, SelectedChoice, context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dheight * 0.032,
          ),
        ],
      )),
    );
  }
}
