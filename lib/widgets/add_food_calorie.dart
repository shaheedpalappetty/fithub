import 'package:flutter/material.dart';
import 'package:workout_app/screens/calorie_dashboard.dart';
import 'package:workout_app/screens/home_page.dart';
import 'package:workout_app/services/db_helper.dart';

class FoodCalorie extends StatefulWidget {
  final String fooditem;
  final double calorie;
  const FoodCalorie({
    required this.calorie,
    required this.fooditem,
    super.key,
  });

  @override
  State<FoodCalorie> createState() => _FoodCalorieState();
}

class _FoodCalorieState extends State<FoodCalorie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.fooditem),
                  IconButton(
                    icon: Icon(Icons.add_box_rounded),
                    onPressed: () {
                      calorieIntake = calorieIntake + widget.calorie;
                      DatabaseHelper.instance.addCalorieIntake(
                          detailsfromDB['userId'], calorieIntake);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Qty : 1',
                  ),
                  Text('Cal : ${widget.calorie}'),
                  IconButton(
                    icon: Icon(Icons.indeterminate_check_box),
                    onPressed: () {
                      setState(() {
                        calorieIntake = calorieIntake - widget.calorie;
                        DatabaseHelper.instance.addCalorieIntake(
                            detailsfromDB['userId'], calorieIntake);
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
