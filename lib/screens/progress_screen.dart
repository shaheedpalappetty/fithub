import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:workout_app/services/db_helper.dart';

import '../widgets/sets_grid_widget.dart';
import 'home_page.dart';
import 'workouts_pages/gym_workouts_grid.dart';

class ProgressScreen extends StatefulWidget {
  final String mapindex;
  final int innermapindex;
  ProgressScreen(
      {super.key, required this.mapindex, required this.innermapindex});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  CountDownController _controller = CountDownController();
  // CountDownController _relaxController = CountDownController();
  bool _isPause = false;
  bool _start = false;
  bool isRelaxing = true;
  int timerIterations = 1;
  int maxIterations = 3;
  bool autoStart = false;
  double Calorie = 0;

  ValueNotifier<int> setNotifier = ValueNotifier<int>(3);
  ValueNotifier<int> repsNotifier = ValueNotifier<int>(10);
  ValueNotifier<bool> isRelaxingNotifier = ValueNotifier(false);
  ValueNotifier<bool> autoStartNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.sizeOf(context).height;
    double Dwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: Text(temp[widget.mapindex]![widget.innermapindex]![0]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Container(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      height: Dheight * 0.33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                temp[widget.mapindex]![widget.innermapindex]![
                                    1],
                              ),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          ValueListenableBuilder<int>(
                            valueListenable: setNotifier,
                            builder: (context, set, child) {
                              return SetsGrid(
                                Dheight: Dheight,
                                Dwidth: Dwidth,
                                label: 'Sets',
                                subtitle: set.toString(),
                              );
                            },
                          ),
                          ValueListenableBuilder<int>(
                            valueListenable: repsNotifier,
                            builder: (context, reps, child) {
                              return SetsGrid(
                                Dheight: Dheight,
                                Dwidth: Dwidth,
                                label: 'Reps',
                                subtitle: reps.toString(),
                              );
                            },
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Set Time : 3 Minutes'),
                          Text('Relax Time : 1 Minute')
                        ],
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isRelaxingNotifier,
                      builder: (context, isRelaxing, child) {
                        return isRelaxing
                            ? Container(
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircularCountDownTimer(
                                      width: 200,
                                      height: 200,
                                      duration: 5,
                                      strokeWidth: 8,
                                      isReverse: true,
                                      isReverseAnimation: true,
                                      strokeCap: StrokeCap.round,
                                      ringColor: Colors.white,
                                      fillColor: const Color.fromARGB(
                                          255, 105, 224, 109),
                                      textStyle: TextStyle(
                                          fontSize: 50,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      backgroundColor: const Color.fromARGB(
                                          255, 180, 237, 182),
                                      onComplete: () {
                                        setState(() {
                                          isRelaxingNotifier.value = false;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Relax!!!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 105, 224, 109),
                                        fontSize: 40,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: autoStartNotifier,
                                      builder: (context, value, child) {
                                        return CircularCountDownTimer(
                                          onStart: () {
                                            Future.delayed(Duration.zero, () {
                                              setState(() {
                                                !isRelaxingNotifier.value
                                                    ? setNotifier.value--
                                                    : setNotifier.value;
                                                if (setNotifier.value < 0) {
                                                  isRelaxingNotifier.value =
                                                      false;
                                                  _controller.reset();
                                                }
                                              });
                                            });
                                          },
                                          onChange: (value) {
                                            int intValue = int.parse(value);
                                            Future.delayed(Duration.zero, () {
                                              repsNotifier.value =
                                                  (intValue / 1).ceil();
                                            });
                                          },
                                          onComplete: () {
                                            Calorie = Calorie +
                                                temp[widget.mapindex]![
                                                        widget.innermapindex]![
                                                    3]; //Adding Calorie
                                            Future.delayed(Duration.zero, () {
                                              if (timerIterations <
                                                  maxIterations) {
                                                setState(() {
                                                  isRelaxingNotifier.value =
                                                      true;
                                                  repsNotifier.value = 10;
                                                  timerIterations++;
                                                  _controller.restart(
                                                      duration: 10);

                                                  // Restart the timer
                                                });
                                              } else {
                                                setState(() {
                                                  // Reset the state when all iterations are completed
                                                  _start = false;
                                                  _isPause = false;
                                                  timerIterations = 0;
                                                  repsNotifier.value = 0;
                                                  setNotifier.value = 3;
                                                  _controller.reset();
                                                  print('Calorie:- $Calorie');
                                                  String key = temp[
                                                          widget.mapindex]![
                                                      widget.innermapindex]![0];
                                                  String newKey =
                                                      key.replaceAll(' ', '');
                                                  print(
                                                      'workout name New KEy:-  $newKey');
                                                  Map<String, dynamic>
                                                      userCalorieDetails = {
                                                    newKey: Calorie,
                                                    'UserId':
                                                        detailsfromDB['userId']
                                                  };
                                                  print(
                                                      'userCalorieDetails:-   $userCalorieDetails');

                                                  UpdateToMuscleTable(
                                                      userCalorieDetails);
                                                  DatabaseHelper.instance
                                                      .createOrUpdateOverallTable(
                                                          detailsfromDB[
                                                              'userId']);

                                                  DatabaseHelper.instance
                                                      .printOverallRowByUserId(
                                                          detailsfromDB[
                                                              'userId']);
                                                  getDEtailsinMuscleTable();
                                                });
                                              }
                                            });
                                          },
                                          autoStart: autoStart,
                                          controller: _controller,
                                          isReverse: true,
                                          isReverseAnimation: true,
                                          initialDuration: 0,
                                          strokeWidth: 8,
                                          backgroundColor: Color.fromARGB(
                                              255, 131, 102, 180),
                                          width: 200,
                                          height: 200,
                                          duration: 10,
                                          fillColor: Colors.deepPurple,
                                          fillGradient: LinearGradient(colors: [
                                            const Color.fromARGB(
                                                255, 68, 0, 186),
                                            Color.fromARGB(255, 85, 22, 192),
                                            Color.fromARGB(255, 92, 39, 183),
                                            Color.fromARGB(255, 110, 67, 186),
                                            Color.fromARGB(255, 131, 102, 180)
                                          ]),
                                          ringColor: _start
                                              ? Colors.white
                                              : Colors.deepPurple,
                                          strokeCap: StrokeCap.round,
                                          textStyle: TextStyle(
                                              fontSize: 50,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              if (!_start) {
                                                _start = true;
                                                autoStart = true;
                                                _controller.start();
                                              } else {
                                                setNotifier.value = 3;
                                                autoStart = false;
                                                _controller.reset();
                                              }
                                            });
                                          },
                                          icon: _start
                                              ? Icon(Icons.restore)
                                              : Icon(Icons.start),
                                          label: _start
                                              ? Text('Reset')
                                              : Text('Start'),
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(120, 40),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25))),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              if (_isPause && _start) {
                                                _isPause = false;
                                                _controller.resume();
                                              } else {
                                                _isPause = true;
                                                _controller.pause();
                                              }
                                            });
                                          },
                                          icon: _isPause
                                              ? Icon(Icons.play_arrow)
                                              : Icon(Icons.pause),
                                          label: _isPause
                                              ? Text('Resume')
                                              : Text('Pause'),
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(120, 40),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25))),
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                      },
                    )
                  ]),
                ))));
  }

// Update calorie to Muscle related Table
  UpdateToMuscleTable(userCalorieDetails) {
    print('Widget.MapIndex${widget.mapindex}');
    switch (widget.mapindex) {
      case 'Chest':
        DatabaseHelper.instance.updateUserChestDetails(userCalorieDetails);
        break;
      case 'Biceps':
        DatabaseHelper.instance.updateUserBicepsDetails(userCalorieDetails);
        break;
      case 'Back':
        DatabaseHelper.instance.updateUserBackDetails(userCalorieDetails);
        break;
      case 'Triceps':
        DatabaseHelper.instance.updateUserTricepsDetails(userCalorieDetails);
        break;
    }
  }

//get Details from Muscle Related Tables
  getDEtailsinMuscleTable() {
    print('Widget.MapIndex${widget.mapindex}');
    switch (widget.mapindex) {
      case 'Chest':
        DatabaseHelper.instance.getAllChestDetails();
        break;
      case 'Biceps':
        DatabaseHelper.instance.getAllBicepsDetails();
        break;
      case 'Back':
        DatabaseHelper.instance.getAllBackDetails();
        break;
      case 'Triceps':
        DatabaseHelper.instance.getAllTricepsDetails();
        break;
    }
  }
}
