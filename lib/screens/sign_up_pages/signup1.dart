import 'package:flutter/material.dart';
import 'package:workout_app/styles/fonts.dart';

class SignUp1 extends StatelessWidget {
  const SignUp1({super.key});

  @override
  Widget build(BuildContext context) {
    // double Dheight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              'assets/images/SignUp1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: const Alignment(0, .4),
            child: const Text(
              'Find the right workout for what you need',
              textAlign: TextAlign.center,
              style: CustomFontStyles.title1,
            ),
          )
        ],
      ),
    );
  }
}
