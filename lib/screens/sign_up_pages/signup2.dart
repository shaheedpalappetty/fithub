import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class SignUp2 extends StatelessWidget {
  const SignUp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              'assets/images/SignUp2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: const Alignment(0, .4),
            child: const Text(
              'Make suitable workouts and great results',
              textAlign: TextAlign.center,
              style: CustomFontStyles.title1,
            ),
          )
        ],
      ),
    );
  }
}
