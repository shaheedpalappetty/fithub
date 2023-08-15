import 'package:flutter/material.dart';
import 'package:workout_app/screens/login_page.dart';

import 'package:workout_app/services/db_helper.dart';

import 'parent_file.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    CheckLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Splash.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

Future<void> CheckLoggedIn(BuildContext context) async {
  try {
    final userDetails = await DatabaseHelper.instance.checkLoggedIn();
    if (userDetails.isNotEmpty) {
      // Existing user found
      print("Logged In user is Available");
      await Future.delayed(Duration(seconds: 3));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNav(
            userDetails: userDetails,
          ),
        ),
        (route) => false,
      );
    } else {
      // No logged-in user found
      print("No Logged In user is Available");
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (route) => false,
      );
    }
  } catch (e) {
    print("Error occurred: $e");
  }
}
