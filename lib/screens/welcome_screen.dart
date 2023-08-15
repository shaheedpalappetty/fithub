import 'package:flutter/material.dart';
import 'package:workout_app/screens/login_page.dart';
import 'package:workout_app/sign_up.dart';

import '../styles/fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/welcomeimage.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Welcome to',
                  style: CustomFontStyles.title3,
                ),
                Text(
                  'Fitness App',
                  style: CustomFontStyles.title1,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ), (route) => false);
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(double.infinity, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ), (route) => false);
                        },
                        child: Text('Signup'))),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
