import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class SignUp3 extends StatelessWidget {
  const SignUp3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/SignUp3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: const Alignment(0, .5),
            child: const Text(
              'Let\'s do a workout and live healthy with us',
              textAlign: TextAlign.center,
              style: CustomFontStyles.title1,
            ),
          )
        ],
      ),
    );
  }
}
