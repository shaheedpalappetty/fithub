import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SetsGrid extends StatelessWidget {
  double Dheight, Dwidth;
  String label, subtitle;
  SetsGrid(
      {super.key,
      required this.Dheight,
      required this.Dwidth,
      required this.label,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        height: Dheight / 12,
        width: Dwidth * .2,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                color: Color(0xff7958FE),
                child: Center(
                    child: Text(
                  label,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                color: Colors.grey[800],
                child: Center(
                    child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
