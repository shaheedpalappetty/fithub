import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_app/styles/fonts.dart';
import '../services/db_helper.dart';
import '../widgets/add_food_calorie.dart';
import 'history.dart';

double calorieIntake = 0.0;

class CalorieDashboard extends StatefulWidget {
  const CalorieDashboard({super.key});

  @override
  State<CalorieDashboard> createState() => _CalorieDashboardState();
}

double totalCalorie = 0.0;

class _CalorieDashboardState extends State<CalorieDashboard> {
  @override
  void initState() {
    super.initState();
    getDetails().then((Map<String, dynamic> overallTablerow) {
      setState(() {
        totalCalorie =
            (overallTablerow[DatabaseHelper.columnWorkoutTotal] ?? totalCalorie)
                .toDouble();
        calorieIntake = (overallTablerow[DatabaseHelper.columnCalorieIntake] ??
                calorieIntake)
            .toDouble();
      });
    });
  }

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Push content above keyboard
              left: 16.0,
              right: 16.0,
              top: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Food Item',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                // Placeholder text field for demonstration
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter food name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Calorie',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for the button here
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Text('ADD'),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(
              context); // Call the function to show the bottom sheet
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5),
              children: [
                Card(
                  color: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Burned  ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset(
                                'assets/images/Activities/Fire.svg')
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            // Define the text spans here.
                            children: <TextSpan>[
                              TextSpan(
                                text: totalCalorie.toString(),
                                style: TextStyle(
                                  // Define the bold text style here.
                                  color: Color(0xff7958FE),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: '  Cal',
                                style: TextStyle(
                                  // Define the italic text style here.
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Intake   ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset(
                              'assets/images/Activities/Calorie.svg',
                            )
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            // Define the text spans here.
                            children: <TextSpan>[
                              TextSpan(
                                text: calorieIntake.toString(),
                                style: TextStyle(
                                  // Define the bold text style here.
                                  color: Color(0xff7958FE),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: '  Cal',
                                style: TextStyle(
                                  // Define the italic text style here.
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Add Today\'s Food Consumptions',
                style: CustomFontStyles.title4,
              ),
            ),
            FoodCalorie(calorie: 75, fooditem: 'Chappathi'),
            FoodCalorie(calorie: 215, fooditem: 'Brown Rice (1 cup cooked)'),
            FoodCalorie(calorie: 55, fooditem: 'Broccoli (1 cup cooked)'),
            FoodCalorie(calorie: 78, fooditem: 'Egg (1 large) ')
          ],
        ),
      ),
    );
  }
}
