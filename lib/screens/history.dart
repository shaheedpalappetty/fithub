import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:workout_app/services/db_helper.dart';
import 'package:workout_app/styles/fonts.dart';

import '../functions/get_dates.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatelessWidget {
  HistoryScreen({
    super.key,
  });

  List goals = [
    'Biceps',
    'Back',
    'Triceps',
    'Chest',
    'Biceps',
    'Back',
    'Chest'
  ];
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String? selectedGoal;

  @override
  Widget build(BuildContext context) {
    List<String> last7DaysDates = getLast7DaysDates();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Text(
                'History',
                style: CustomFontStyles.title2,
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: (goals.length / 2).floor(),
                itemBuilder: (context, index) {
                  return CustomCard(
                    date: last7DaysDates[index],
                    muscleName: goals[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String muscleName;
  final String date;
  const CustomCard({super.key, required this.date, required this.muscleName});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

double totalCalorie = 0.0;

class _CustomCardState extends State<CustomCard> {
  @override
  void initState() {
    super.initState();
    getDetails().then((Map<String, dynamic> overallTablerow) {
      setState(() {
        totalCalorie =
            (overallTablerow[DatabaseHelper.columnWorkoutTotal] ?? totalCalorie)
                .toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 13, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: TextStyle(
                              color: Color(0xff7958FE),
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: totalCalorie.toString()),
                            TextSpan(
                                text: '  Cal',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))
                          ])),
                  Text(widget.date)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: Text(
                      widget.muscleName,
                      style: CustomFontStyles.title4,
                    ),
                  ),
                  Container(
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                        ),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                        ),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> getDetails() async {
  final overallTableRow =
      await DatabaseHelper.instance.getCalorieDetails(detailsfromDB['userId']);
  return overallTableRow;
}
