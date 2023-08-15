import 'package:flutter/material.dart';

class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 162,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: AssetImage(image),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple[200],
        ),
        child: Align(
          alignment: Alignment(-.8, .8),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
