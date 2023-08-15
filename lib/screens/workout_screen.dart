import 'package:flutter/material.dart';

import 'package:workout_app/screens/history.dart';
import 'package:workout_app/screens/tab1.dart';
import 'package:workout_app/screens/workouts_pages/gym_workouts_grid.dart';

import 'add_tableto_db.dart';
import 'home_page.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Workouts'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.home_outlined),
              )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TabBar(
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple),
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: 'Workouts',
                      ),
                      Tab(text: 'History'),
                    ]),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: TabBarView(children: [Tab1(), HistoryScreen()])),
              ],
            ),
          ),
        ));
  }
}

class WorkoutsGrid extends StatelessWidget {
  final int GridValue;
  WorkoutsGrid({super.key, required this.GridValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            addToDataBase(GridValue);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return GymWorkouts(
                  mapindex: workouts[GridValue]![0],
                );
              },
            ));
          },
          child: Container(
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Container(
                    height: 130,
                    child: Image.asset(
                      workouts[GridValue]![1],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.grey[900],
                        child: Center(child: Text(workouts[GridValue]![0]))),
                  ),
                ],
              )),
        ));
  }
}
