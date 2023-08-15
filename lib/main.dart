import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          datePickerTheme: DatePickerThemeData(
            surfaceTintColor: Colors.deepPurple,

            todayBackgroundColor: MaterialStatePropertyAll(Color(0xff7958FE)),
            // dayBackgroundColor: MaterialStatePropertyAll(Color(0xff7958FE))
          ),
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Color(0xff7958FE)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    24), // Set border radius for focused state
                borderSide: BorderSide(
                    color: Color(
                        0xff7958FE)), // Set border color for focused state
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    24), // Set border radius for enabled (normal) state
                borderSide: BorderSide(
                    color: Color(
                        0xFF7958FE)), // Set border color for enabled (normal) state
              )),
          chipTheme: ChipThemeData(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: StadiumBorder(),
            backgroundColor: Colors.grey[900],
            selectedColor: Color(0xff7958FE),
            labelStyle: TextStyle(color: Colors.white),
          ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              iconSize: 35,
              backgroundColor: Color(0xff7958FE),
              foregroundColor: Colors.white,
              focusElevation: 6.0),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black45,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color(0xff7958FE)))),
          primaryColor: Color(0xff7958FE)),
      debugShowCheckedModeBanner: false,
      home: SplashScreeen(),
    );
  }
}
