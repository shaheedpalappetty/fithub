import 'package:flutter/material.dart';
import 'package:workout_app/screens/progress_screen.dart';

import 'workouts_pages/gym_workouts_grid.dart';

class StepsWorkouts extends StatelessWidget {
  final String mapindex;
  final int innermapindex;
  StepsWorkouts(
      {super.key, required this.mapindex, required this.innermapindex});

  // final data = temp['Chest']![0]![2];

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;

    return Scaffold(
        appBar: AppBar(
          title: Text(temp[mapindex]![innermapindex]![0]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: Dheight * 0.33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              temp[mapindex]![innermapindex]![1],
                            ))),
                  ),
                  SizedBox(
                    height: Dheight * 0.03,
                  ),
                  Container(
                    height: Dheight * .43,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: temp[mapindex]![innermapindex]![2].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${index + 1}. '),
                              Expanded(
                                  child: Text(temp['Chest']![innermapindex]![
                                      2]![index]))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment(0, 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(240, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ProgressScreen(
                                    innermapindex: innermapindex,
                                    mapindex: mapindex,
                                  );
                                },
                              ));
                            },
                            child: Text('Start'))),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
