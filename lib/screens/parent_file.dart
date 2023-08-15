import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:workout_app/screens/home_page.dart';
import 'package:workout_app/screens/profile_screen.dart';
import 'package:workout_app/screens/history.dart';
import 'package:workout_app/screens/search.dart';

import '../functions/select_todays_workout.dart';
import '../services/db_helper.dart';
import '../widgets/menu_drawer.dart';

List<String> valuesFromTodaysWorkout = todaysWorkout();
String tableName = valuesFromTodaysWorkout[1];
String assetImage = valuesFromTodaysWorkout[0];
Map<String, dynamic> todaysRecommendation = {};

class BottomNav extends StatefulWidget {
  final userDetails;
  const BottomNav({Key? key, required this.userDetails});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late Future<void> _pagesFuture;
  late List<Widget> _pages = [];
  int _currentPageIndex = 0;
  Map<String, dynamic> todaysRecommendation = {};

  @override
  void initState() {
    super.initState();
    _pagesFuture = setupPages();
    _initRecomentationDetails();
  }

  Future<void> setupPages() async {
    await getRecomentationDetails();

    _pages = [
      Home(
        userDetails: widget.userDetails,
        todaysRecommendation: todaysRecommendation,
      ),
      HistoryScreen(),
      ProfileScreen(userDetails: widget.userDetails),
      SearchScreen(),
    ];
  }

  Future<void> getRecomentationDetails() async {
    List<String> valuesFromTodaysWorkout = todaysWorkout();
    String tableName = valuesFromTodaysWorkout[1];

    int? userId = widget.userDetails['userId']; // Declare as nullable int
    if (userId != null) {
      // Proceed with getting the recommendation data
      todaysRecommendation =
          await DatabaseHelper.instance.getRecommendation(userId, tableName);
    } else {
      // Handle the case when 'userId' is null
      todaysRecommendation = {}; // Set a default value as an empty map
    }
  }

  Future<void> _initRecomentationDetails() async {
    await getRecomentationDetails();
    // If you need to update the UI based on the new recommendation data, call setState here
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;
    return FutureBuilder<void>(
      future: _pagesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding:
                      EdgeInsets.only(right: Dheight / 32.4, top: Dheight / 81),
                  child: Container(
                    height: Dheight / 20.25,
                    width: Dheight / 20.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(File(widget.userDetails['userImage'])),
                      ),
                    ),
                  ),
                )
              ],
            ),
            drawer: MenuDrawer(userDetails: widget.userDetails),
            body: _pages[_currentPageIndex],
            bottomNavigationBar: Container(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(Dheight / 40.5),
                child: GNav(
                  selectedIndex: _currentPageIndex,
                  onTabChange: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Color(0xff7958FE),
                  gap: 8,
                  padding: EdgeInsets.all(Dheight / 81),
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.list_alt_rounded,
                      text: 'History',
                    ),
                    GButton(
                      icon: Icons.person_2,
                      text: 'Profile',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
