import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_app/screens/home_page.dart';
import 'package:workout_app/services/db_helper.dart';

import 'deatails_from_db.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  String _selectedMuscleType = '';
  bool _isMuscleTypeSelected = false;
  List<String> _muscleTypes = ['Chest', 'Biceps', 'Back', 'Triceps', 'All'];

  //function for when Search Button Pressed
  void _onSearchButtonPressed() async {
    if (_isMuscleTypeSelected) {
      // Perform the search logic here based on the selected date range and muscle type
      String startDate = _startDateController.text;
      String endDate = _endDateController.text;
      DateTime sDate = DateFormat('MMM d, y').parse(startDate);
      DateTime eDate = DateFormat('MMM d, y').parse(endDate);

      List<Map<String, dynamic>> result = await DatabaseHelper.instance
          .searchFromDB(
              sDate, eDate, _selectedMuscleType, detailsfromDB['userId']);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Details(
              selectedMuscleType: _selectedMuscleType,
              tableData: List.from(result),
            );
          },
        ),
      );
    } else {
      // Show error message for not selecting a muscle type
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a muscle type.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select a date range for the past three months:'),
              SizedBox(height: 26),
              TextField(
                readOnly: true,
                controller: _startDateController,
                onTap: () async {
                  DateTime? pickedStartDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 90)),
                    lastDate: DateTime.now(),
                  );

                  if (pickedStartDate != null) {
                    setState(() {
                      _startDateController.text =
                          DateFormat('MMM d, y').format(pickedStartDate);
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 26),
              TextField(
                readOnly: true,
                controller: _endDateController,
                onTap: () async {
                  DateTime? pickedEndDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 90)),
                    lastDate: DateTime.now(),
                  );

                  if (pickedEndDate != null) {
                    setState(() {
                      _endDateController.text =
                          DateFormat('MMM d, y').format(pickedEndDate);
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: 'End Date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 26),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                children: _muscleTypes
                    .map(
                      (type) => ChoiceChip(
                        label: Text(type),
                        selected: _selectedMuscleType == type,
                        onSelected: (isSelected) {
                          setState(() {
                            if (isSelected) {
                              _selectedMuscleType = type;
                              _isMuscleTypeSelected = true;
                            } else {
                              _isMuscleTypeSelected = false;
                            }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _onSearchButtonPressed,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(24), // Set the border radius
                    ), // Make the button bigger
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(
                        fontSize: 18), // Customize the button text size
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
