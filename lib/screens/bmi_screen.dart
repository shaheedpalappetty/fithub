import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class BMIDetailsScreen extends StatelessWidget {
  final double bmiValue;

  BMIDetailsScreen({required this.bmiValue});

  String getBMIStatus() {
    if (bmiValue == 0.0) return 'Unknown';
    if (bmiValue < 18.5) return 'Underweight';
    if (bmiValue < 24.9) return 'Normal weight';
    if (bmiValue < 29.9) return 'Overweight';
    return 'Obese';
  }

  String getBMIInterpretation() {
    if (bmiValue == 0.0) return 'Please calculate BMI first';
    if (bmiValue < 18.5)
      return 'You are underweight. Consider gaining some weight for better health.';
    if (bmiValue < 24.9) return 'Congratulations! You have a normal BMI.';
    if (bmiValue < 29.9)
      return 'You are overweight. Consider starting a healthy diet and exercise routine.';
    return 'You are obese. Seek medical advice to manage your weight.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Details'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: KdGaugeView(
                  minSpeed: 0,
                  maxSpeed: 40,
                  speed: bmiValue,
                  speedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                  animate: true,
                  duration: Duration(seconds: 2),
                  alertSpeedArray: [0, 18.4, 24.9, 29.9],
                  alertColorArray: [
                    Colors.orange,
                    Colors.green,
                    Colors.orange,
                    Colors.red
                  ],
                  unitOfMeasurement: 'BMI',
                  unitOfMeasurementTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                  gaugeWidth: 15,
                  fractionDigits: 1,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              getBMIStatus(),
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              'BMI Value',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              bmiValue.toStringAsFixed(1),
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 44.0),
            Text(
              'Health Details',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18.0),
            Text(
              getBMIInterpretation(),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
