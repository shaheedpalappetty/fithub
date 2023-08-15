import 'package:flutter/material.dart';

import '../steps_workout_page.dart';

final Map<String, Map<int, List<dynamic>>> temp = {
  'Chest': {
    0: [
      'Bench Press',
      'assets/images/gym_exercises/chest/bench-press.gif',
      [
        'Set up the bench and adjust the barbell height.',
        'Lie on the bench with your feet on the ground.',
        'Grip the bar with a slightly wider than shoulder-width grip.',
        'Arch your back slightly and retract your shoulder blades.',
        'Lift the bar off the rack and position it above your chest.',
        'Lower the bar to your chest while keeping your elbows at a 45-degree angle.',
        'Press the bar back up to the starting position.',
        'Lockout your elbows at the top of the movement.',
        'Lower the bar back down to your chest.',
        'Rack the bar once you\'ve completed your set.',
      ],
      9.5
    ],
    1: [
      'Incline Press',
      'assets/images/gym_exercises/chest/incline-barbell-press.gif',
      [
        'Adjust the incline bench to the desired angle.',
        'Sit on the bench with your feet flat on the ground and your back against the bench.',
        'Grip the barbell with a slightly wider than shoulder-width grip.',
        'Arch your back slightly and retract your shoulder blades.',
        'Lift the barbell off the rack and hold it above your upper chest with arms extended.',
        'Lower the barbell towards your upper chest.',
        'Press the barbell back up to the starting position.',
        'Lockout your elbows at the top of the movement.',
        'Lower the barbell back down to your upper chest.',
        'Rack the barbell once you\'ve completed your set.'
      ],
      8
    ],
    2: [
      'Decline Bench Press',
      'assets/images/gym_exercises/chest/decline-bench-press.gif',
      [
        'Set up the decline bench at the desired angle.',
        'Lie on the bench with your feet secured and your head positioned lower.',
        'Grip the barbell with a slightly wider than shoulder-width grip.',
        'Flatten your back against the bench and engage your core.',
        'Lift the barbell off the rack and hold it above your lower chest with arms extended.',
        'Lower the barbell towards your lower chest.',
        'Press the barbell back up to the starting position.',
        'Lockout your elbows at the top of the movement.',
        'Lower the barbell back down to your lower chest.',
        'Rack the barbell once you\'ve completed your set'
      ],
      7
    ],
    3: [
      'Dumbbell Flys',
      'assets/images/gym_exercises/chest/Dumbbell-Chest-Fly.webp',
      [
        'Lie flat on a bench with a dumbbell in each hand.',
        'Start with your arms extended above your chest, palms facing each other.',
        'Lower the dumbbells in a wide arc out to the sides while keeping a slight bend in your elbows.',
        'Feel a stretch in your chest muscles without any discomfort or excessive stretching.',
        'Engage your chest muscles and raise the dumbbells back to the starting position.',
        'Repeat the movement for your desired number of repetitions.',
        'Rest and prepare for your next set.'
      ],
      7
    ],
    4: [
      'Push Ups',
      'assets/images/gym_exercises/chest/push-up.gif',
      [
        'Start in a high plank position with hands slightly wider than shoulder-width apart.',
        'Lower your body by bending your elbows and keeping them close to your sides.',
        'Lower until your chest is about an inch from the ground.',
        'Push back up by straightening your arms and returning to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      5.2
    ],
    5: [
      'Cable Crossover Flys',
      'assets/images/gym_exercises/chest/cable-chest-fly.gif',
      [
        'Set the cable pulleys to shoulder height or slightly higher.',
        'Stand in the center with feet shoulder-width apart and grab the handles.',
        'Step forward with one foot for stability.',
        'Start with arms extended out to the sides, slightly bent at the elbows.',
        'Bring the handles together in front of your body, crossing them over each other.',
        'Feel the squeeze in your chest muscles.',
        'Slowly return to the starting position, feeling a stretch in your chest.',
        'Repeat for your desired number of repetitions.',
        'Switch foot position and perform another set.'
      ],
      7
    ],
    6: [
      'Pec Deck Flies',
      'assets/images/gym_exercises/chest/PoshCheapComet-size_restricted.gif',
      [
        'Adjust the machine to your chest level.',
        'Sit on the machine with your back against the backrest and feet flat on the floor.',
        'Grasp the handles with a neutral or overhand grip.',
        'Start with your elbows slightly below shoulder level and upper arms parallel to the floor.',
        'Push the handles forward by squeezing your chest muscles.',
        'Feel the stretch in your chest muscles.',
        'Slowly return to the starting position.',
        'Repeat for your desired number of repetitions.',
        'Make any necessary adjustments to the machine for comfort and alignment.'
      ],
      7
    ],
    7: [
      'Decline Pushup',
      'assets/images/gym_exercises/chest/Decline pushup.gif',
      [
        'Set up with your hands on an elevated surface and your feet on the ground, creating a decline angle.',
        'Maintain a strong plank position with a straight body from head to heels.',
        'Lower your chest towards the elevated surface by bending your elbows.',
        'Keep your body straight and lower until your chest is just above the elevated surface.',
        'Push back up by extending your arms and raising your body to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      5.2
    ],
    8: [
      'Dumbbell Pullovers',
      'assets/images/gym_exercises/chest/Dumbbell-Pullover.webp',
      [
        'Lie flat on a bench with your feet planted on the ground.',
        'Hold a dumbbell with both hands above your chest.',
        'Lower the dumbbell behind your head while keeping a slight bend in your elbows.',
        'Feel a stretch in your chest and lats.',
        'Use your chest and back muscles to raise the dumbbell back to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      7
    ],
    9: [
      'Parallel Bar Dips',
      'assets/images/gym_exercises/chest/inclne-dumbel-press.gif',
      [
        'Grip the parallel bars with your hands, palms facing down.',
        'Lift yourself up, fully extending your arms, and support your body weight between the bars.',
        'Lower your body by bending your elbows, keeping them close to your sides.',
        'Lower until your shoulders are slightly below your elbows or until you feel a comfortable stretch.',
        'Push back up by extending your arms, using your chest, shoulders, and triceps.',
        'Repeat for your desired number of repetitions.'
      ],
      5.2
    ],
    10: [
      'Dumbbell Press',
      'assets/images/gym_exercises/chest/Dumbbell-Incline-Press.gif',
      [
        'Sit on a bench with back support and hold a dumbbell in each hand at shoulder level.',
        'Push the dumbbells upward, fully extending your arms.',
        'Lower the dumbbells back down to shoulder level, bending your elbows.',
        'Press the dumbbells back up to the starting position, fully extending your arms.',
        'Repeat for your desired number of repetitions.'
      ],
      7
    ],
    11: [
      'Barbell Bench Press',
      'assets/images/gym_exercises/chest/barbell-bench-press.gif',
      [
        'Lie down on a flat bench with your feet planted firmly on the ground.',
        'Grasp the barbell with an overhand grip, slightly wider than shoulder-width apart.',
        'Unrack the barbell and hold it directly above your chest with arms fully extended.',
        'Lower the barbell to your chest by bending your elbows, keeping them at a 45-degree angle.',
        'Press the barbell back up by extending your arms.',
        'Repeat for your desired number of repetitions.'
      ],
      7
    ]
  },
  'Biceps': {
    0: [
      'Barbell Curls',
      'assets/images/gym_exercises/Biceps/Barbell-biceps-curl.gif',
      [
        'Stand with feet shoulder-width apart and grasp the barbell with an underhand grip.',
        'Start with arms extended, holding the barbell in front of your thighs.',
        'Curl the barbell up towards your shoulders by flexing your elbows.',
        'Squeeze your biceps at the top of the movement.',
        'Lower the barbell back down to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      7.5
    ],
    1: [
      'Reverse Curls',
      'assets/images/gym_exercises/Biceps/barbell reverse curls.webp',
      [
        'Stand with feet shoulder-width apart and grasp the barbell with an overhand grip.',
        'Start with arms extended, holding the barbell in front of your thighs, palms facing downward.',
        'Curl the barbell up towards your shoulders by flexing your elbows, focusing on your forearms.',
        'Squeeze your forearms at the top of the movement.',
        'Lower the barbell back down to the starting position.',
        'Repeat for your desired number of repetitions.',
      ],
      7.5
    ],
    2: [
      'Preacher Curls',
      'assets/images/gym_exercises/Biceps/preacher curls.webp',
      [
        'Sit on a preacher curl bench with your upper arms resting comfortably on the padded surface.',
        'Hold the barbell with an underhand grip, palms facing upward, and arms fully extended.',
        'Curl the barbell upward by flexing your elbows, focusing on contracting your biceps.',
        'Squeeze your biceps at the top of the movement.',
        'Lower the barbell back down to the starting position in a controlled manner.',
        'Repeat for your desired number of repetitions.'
      ],
      7
    ],
    3: [
      'Cable Biceps Curl',
      'assets/images/gym_exercises/Biceps/Benefits_Cable_Curl.webp',
      [
        'Stand facing a cable machine with the cable set to a low position.',
        'Grasp the handle with an underhand grip, palms facing upward.',
        'Curl the handle upward by flexing your elbows, keeping your upper arms stationary.',
        'Squeeze your biceps at the top of the movement.',
        'Lower the handle back down to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      8
    ],
//       4: [
//         'Dumbbell Biceps Curl',
//         'assets/images/gym_exercises/Biceps/Dumbbell-Biceps Curl(hammer grip on bench).webp',
//         '''1.Sit on a bench with a straight back, feet flat on the floor, and a dumbbell in each hand.
// 2.Hold the dumbbells with a neutral hammer grip, palms facing each other, and let your arms hang by your sides.
// 3.Place the back of your upper arms on the bench, ensuring they are in contact with the surface. Your forearms should be off the bench.
// 4.Curl the dumbbells upward by flexing your elbows, keeping your upper arms and elbows stationary.
// 5.Squeeze your biceps at the top of the movement.
// 6.Lower the dumbbells back down to the starting position.
// 7.Repeat for your desired number of repetitions.'''
//       ],
    4: [
      'Dumbbell Biceps Curl',
      'assets/images/gym_exercises/Biceps/biceps Dumbbell curl(hammer grip standing).gif',
      [
        'Stand up straight with a dumbbell in each hand, palms facing each other.',
        'Keep your upper arms stationary and your elbows close to your torso.',
        'Curl the dumbbells upward by flexing your elbows, keeping your wrists straight.',
        'Squeeze your biceps at the top of the movement.',
        'Lower the dumbbells back down to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      9
    ],
    5: [
      'Dumbbell Curl',
      'assets/images/gym_exercises/Biceps/dumbbell biceps curl(Underhand Grip concentration with single arm).webp',
      [
        'Sit on a bench or chair with a dumbbell in one hand.',
        'Rest your elbow on the inside of your thigh, near the knee, with your palm facing up.',
        'Curl the dumbbell upward by flexing your elbow, keeping your upper arm stationary.',
        'Squeeze your biceps at the top of the movement.',
        'Lower the dumbbell back down to the starting position in a controlled manner.',
        'Repeat for your desired number of repetitions.',
        'Switch to the other arm and repeat the exercise.'
      ],
      6
    ],
    6: [
      'Dumbbell Curl Stand',
      'assets/images/gym_exercises/Biceps/dumbbell biceps curl ( underhand standing grip).webp',
      [
        'Stand up straight with a dumbbell in each hand, palms facing upward.',
        'Curl the dumbbells upward by flexing your elbows, keeping your upper arms stationary.',
        'Squeeze your biceps at the top of the movement.',
        'Lower the dumbbells back down to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      6.5
    ]
  },
  'Back': {
    0: [
      'Chin Ups',
      'assets/images/gym_exercises/Back/ChinUps.gif',
      [
        'Find a chin-up bar or sturdy overhead bar.',
        'Hang from the bar with an underhand grip, palms facing toward you.',
        'Pull yourself up by bending your elbows and lifting your body until your chin clears the bar.',
        'Lower yourself back down in a controlled manner, fully extending your arms.',
        'Repeat for your desired number of repetitions.'
      ],
      10.5
    ],
    1: [
      'Lat Pull Down',
      'assets/images/gym_exercises/Back/lat-pull-down.gif',
      [
        'Sit on the lat pull-down machine and secure your knees under the leg pads.',
        'Grab the wide bar attachment with an overhand grip, hands slightly wider than shoulder-width apart.',
        'Pull the bar down towards your upper chest by engaging your lats and squeezing your shoulder blades together.',
        'Pause briefly at the bottom of the movement, feeling the contraction in your lats.',
        'Slowly release the bar back to the starting position, fully extending your arms.',
        'Repeat for your desired number of repetitions.'
      ],
      10
    ],
    2: [
      'Back Extensions',
      'assets/images/gym_exercises/Back/back-extension.gif',
      [
        'Position yourself on a back extension machine or exercise mat, lying face down with your hips resting on the pad and your feet secured.',
        'Keep your hands either crossed on your chest or extended in front of you.',
        'Lift your upper body by extending your spine, using your lower back muscles.',
        'Pause briefly at the top of the movement, feeling the contraction in your lower back.',
        'Lower your upper body back down in a controlled manner.',
        'Repeat for your desired number of repetitions.'
      ],
      7.5
    ],
    3: [
      'Dead Lifts',
      'assets/images/gym_exercises/Back/Romanian-deadlift.webp',
      [
        'Stand with your feet hip-width apart and a barbell centered on the floor in front of you.',
        'Bend your knees and hinge at the hips to grip the barbell with both hands. Use an overhand or mixed grip.',
        'Keep your back straight, chest up, and engage your core and glutes for stability.',
        'Lift the barbell off the floor by extending your hips and knees, pushing through your heels.',
        'Keep the barbell close to your body, maintaining contact with your shins and thighs.',
        'Stand tall, fully extending your hips and knees at the top of the lift.',
        'Lower the barbell back down to the floor in a controlled manner, bending your hips and knees.',
        'Repeat for your desired number of repetitions.'
      ],
      15
    ],
    4: [
      'T Bar Bent Over Row',
      'assets/images/gym_exercises/Back/t-bar-row.gif',
      [
        'Set up a T-bar machine with the desired weight and attachment.',
        'Stand with your feet shoulder-width apart, facing the weighted end of the bar.',
        'Bend your knees slightly and hinge forward at the hips, keeping your back straight and chest up.',
        'Grip the bar with both hands, palms facing inward (pronated grip), slightly wider than shoulder-width apart.',
        'Pull the bar towards your upper abdomen by retracting your shoulder blades and bending your elbows.',
        'Squeeze your back muscles at the top of the movement.',
        'Lower the bar back down in a controlled manner, maintaining proper form.',
        'Repeat for your desired number of repetitions.'
      ],
      10.5
    ],
    5: [
      'Seated Rows',
      'assets/images/gym_exercises/Back/seatedcablerow.gif',
      [
        'Sit on a seated row machine and secure your feet on the footplates.',
        'Grab the handles with an overhand grip, hands slightly wider than shoulder-width apart.',
        'Sit up straight, engage your core, and keep your back against the pad.',
        'Pull the handles toward your torso by retracting your shoulder blades and bending your elbows.',
        'Squeeze your back muscles at the end of the movement.',
        'Slowly release the handles back to the starting position, fully extending your arms.',
        'Repeat for your desired number of repetitions.'
      ],
      8
    ],
    6: [
      'One Arm Dumbbell Rows',
      'assets/images/gym_exercises/Back/One Arm Dumbbell rows.gif',
      [
        'Place a dumbbell on the floor next to a flat bench.',
        'Position yourself next to the bench with one knee and hand on the bench for support, and the other leg extended to the side.',
        'With your free hand, pick up the dumbbell from the floor, keeping your back straight and core engaged.',
        'Rest your supporting hand on the bench for stability.',
        'Pull the dumbbell up towards your hip by retracting your shoulder blade and bending your elbow.',
        'Squeeze your back muscles at the top of the movement.',
        'Loer the dumbbell back down in a controlled manner, fully extending your arm.',
        'Repeat for your desired number of repetitions, then switch sides and repeat with the other arm.'
      ],
      10.2
    ],
    7: [
      'Bent over Row',
      'assets/images/gym_exercises/Back/Bent over row.gif',
      [
        'Stand with your feet shoulder-width apart, knees slightly bent, and hold a barbell or dumbbells with an overhand grip.',
        'Hinge forward at your hips, keeping your back straight and parallel to the floor.',
        'Pull the weight towards your upper abdomen by retracting your shoulder blades and bending your elbows.',
        'Squeeze your back muscles at the top of the movement.',
        'Slowly lower the weight back down in a controlled manner.',
        'Repeat for your desired number of repetitions.'
      ],
      10.5
    ],
    8: [
      'Dumbbell Bent Over Row',
      'assets/images/gym_exercises/Back/dumbells Bell Over row.gif',
      [
        'Stand with your feet shoulder-width apart, holding a dumbbell in each hand.',
        'Hinge forward at your hips, keeping your back straight and parallel to the floor.',
        'Pull the dumbbells towards your upper abdomen by retracting your shoulder blades and bending your elbows.',
        'Squeeze your back muscles at the top of the movement.',
        'Lower the dumbbells back down in a controlled manner.',
        'Repeat for your desired number of repetitions.'
      ],
      11
    ],
    9: [
      'Seated Bent Over Row',
      'assets/images/gym_exercises/Back/Seated Bent Over Row.gif',
      [
        'Sit on a bench or chair with your feet flat on the floor and hold a dumbbell in each hand.',
        'Hinge forward at your hips, keeping your back straight and chest up.',
        'Pull the dumbbells towards your upper abdomen by retracting your shoulder blades and bending your elbows.',
        'Squeeze your back muscles at the top of the movement.',
        'Lower the dumbbells back down in a controlled manner.',
        'Repeat for your desired number of repetitions.'
      ],
      9
    ]
  },
  'Triceps': {
    0: [
      'Diamond Push Up',
      'assets/images/gym_exercises/Triceps/Diamond Push up.gif',
      [
        'Start in a high plank position on the floor, with your hands close together and forming a diamond shape with your thumbs and index fingers.',
        'Lower your body towards the floor by bending your elbows, keeping them close to your sides.',
        'Lower yourself until your chest touches or comes close to touching your hands.',
        'Push through your palms to straighten your arms and return to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      10
    ],
    1: [
      'Close Grip Bench Presses',
      'assets/images/gym_exercises/Triceps/Close grip Bench Presses.gif',
      [
        'Lie down on a flat bench and grasp the barbell with a grip that is narrower than shoulder-width apart, palms facing towards you.',
        'Lift the barbell off the rack and hold it directly above your chest, arms fully extended.',
        'Lower the barbell towards your chest, keeping your elbows close to your body.',
        'Touch your chest with the barbell, then push it back up by extending your arms.',
        'Exhale as you push the barbell up, and squeeze your chest muscles at the top.',
        'Repeat for your desired number of repetitions.'
      ],
      10.5
    ],
    2: [
      'Barbell Lying Tricep',
      'assets/images/gym_exercises/Triceps/Barbell-Lying-Tricep-Extension.gif',
      [
        'Lie flat on a bench with your feet planted on the ground. Hold a barbell with an overhand grip, hands shoulder-width apart, and extend your arms straight up over your chest.',
        'Slowly lower the barbell towards your forehead by bending your elbows, keeping your upper arms stationary.',
        'Pause briefly when the barbell is just above your forehead, then extend your arms to lift the barbell back to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      8
    ],
    3: [
      'Dumbbell Row Kick Back',
      'assets/images/gym_exercises/Triceps/Dumbel Row Kickback.gif',
      [
        'Stand with your feet shoulder-width apart, holding a dumbbell in each hand.',
        'Bend forward at your hips, keeping your back straight and chest up. Your torso should be almost parallel to the floor.',
        'Keep your elbows close to your sides and bend them at a 90-degree angle, with your forearms parallel to the ground. This is your starting position.',
        'Extend your arms straight behind you, squeezing your shoulder blades together and contracting your back muscles.',
        'Hold the contracted position for a brief moment, then bend your elbows to bring the dumbbells back to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      11
    ],
    4: [
      'Triceps Push Down',
      'assets/images/gym_exercises/Triceps/Triceps pushdown.gif',
      [
        'Stand facing a cable machine with your feet shoulder-width apart and a slight bend in your knees.',
        '2.Grab the cable attachment with an overhand grip, palms facing down, and hands shoulder-width apart.',
        '3.Keep your elbows close to your sides and upper arms parallel to the floor.',
        '4.Push the cable attachment down towards your thighs, straightening your arms.',
        '5.Squeeze your triceps at the bottom of the movement.',
        '6.Slowly bring the cable attachment back up to the starting position.',
        '7.Repeat for your desired number of repetitions.'
      ],
      7
    ],
    5: [
      'One Arm Dumbbell Triceps Extensions',
      'assets/images/gym_exercises/Triceps/Dumbbell-Standing-Triceps-Extension.gif',
      [
        'Stand with your feet shoulder-width apart, holding a dumbbell in one hand.',
        'Raise the dumbbell overhead, fully extending your arm.',
        'Lower the dumbbell behind your head by bending your elbow, keeping your upper arm close to your head.',
        'Pause briefly at the bottom of the movement.',
        'Extend your arm to raise the dumbbell back to the starting position.',
        'Repeat for your desired number of repetitions on one arm, then switch to the other arm.'
      ],
      8
    ],
    6: [
      'Side One Arm Reverse Push Down',
      'assets/images/gym_exercises/Triceps/Side-One-Arm-Reverse-Pushdown.gif',
      [
        'Stand next to a cable machine with your feet shoulder-width apart.',
        'Grasp the handle or rope attachment with one hand, palm facing down (supinated grip).',
        'Step away from the machine to create tension in the cable.',
        'Keep your upper arm stationary and fully extend your arm out to the side.',
        'Push the handle or rope down towards your thigh, contracting your triceps.',
        'Pause briefly at the bottom of the movement, squeezing your triceps.',
        'Slowly release the handle or rope, allowing it to return to the starting position under control.',
        'Repeat for your desired number of repetitions on one arm, then switch to the other arm.'
      ],
      8.5
    ],
    7: [
      'Seated Triceps Extension',
      'assets/images/gym_exercises/Triceps/Seated Triceps Extension.gif',
      [
        'Sit on a bench or chair with your back straight and feet flat on the floor.',
        'Hold a dumbbell with both hands, palms facing up, and raise it above your head.',
        'Bend your elbows and lower the dumbbell behind your head, keeping your upper arms close to your ears.',
        'Straighten your arms, lifting the dumbbell back up to the starting position.',
        'Pause briefly at the top of the movement, squeezing your triceps.',
        'Lower the dumbbell back down behind your head by bending your elbows.',
        'Repeat for your desired number of repetitions.'
      ],
      7
    ],
    8: [
      'Triceps Dips',
      'assets/images/gym_exercises/Triceps/Triceps Dips.gif',
      [
        'Find a sturdy bench, chair, or parallel bars and position yourself in front of it.',
        'Place your hands on the edge of the bench or parallel bars, shoulder-width apart, with your fingers pointing forward.',
        'Walk your feet forward and extend your legs, keeping a slight bend in your knees.',
        'Lower your body by bending your elbows, allowing your body to descend towards the ground.',
        'Continue descending until your elbows reach a 90-degree angle or slightly below, feeling a stretch in your triceps.',
        'Push through your palms and engage your triceps to straighten your arms and return to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      11
    ],
    9: [
      'Triceps Kick Back',
      'assets/images/gym_exercises/Triceps/Triceps Kick Back.gif',
      [
        'Stand with your feet shoulder-width apart, holding a dumbbell in each hand.',
        'Bend your knees slightly and hinge forward at the hips, keeping your back straight.',
        'Bend your elbows to a 90-degree angle, bringing the dumbbells close to your chest.',
        'Extend your forearms backward, straightening your elbows while keeping your upper arms stationary.',
        'Pause briefly at the top of the movement, squeezing your triceps.',
        'Slowly lower the dumbbells back to the starting position by bending your elbows.',
        'Repeat for your desired number of repetitions.'
      ],
      8
    ],
    10: [
      'Bar Triceps Extension',
      'assets/images/gym_exercises/Triceps/Bar Triceps Extension sitting on a bench.gif',
      [
        'Sit on a bench or chair with your back straight and feet flat on the floor.',
        'Hold an EZ bar with an overhand grip, hands shoulder-width apart.',
        'Lift the bar above your head and fully extend your arms.',
        'Lower the bar behind your head by bending your elbows, keeping your upper arms close to your head.',
        'Pause briefly at the bottom of the movement, feeling a stretch in your triceps.',
        'Extend your arms and raise the bar back up to the starting position.',
        'Repeat for your desired number of repetitions.'
      ],
      7.5
    ]
  },
  'Shoulder': {
    0: [
      'Military Press Behind The Neck',
      'assets/images/gym_exercises/Shoulder/Military Press Behind The Neck.gif',
      [
        'Stand with your feet shoulder-width apart and grasp the barbell with a wide overhand grip.',
        'Lift the barbell off the rack and position it behind your head, resting it on your upper traps or the back of your shoulders.',
        'Keep your core engaged, chest up, and elbows pointed straight ahead.',
        'Push the barbell upward by extending your arms until they are fully extended overhead.',
        'Pause briefly at the top, then slowly lower the barbell back down to the starting position behind your neck.',
        'Repeat for your desired number of repetitions.'
      ]
    ],
  }
};

class GymWorkouts extends StatelessWidget {
  final String mapindex;

  GymWorkouts({
    super.key,
    required this.mapindex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(mapindex),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home_outlined),
            )
          ],
        ),
        body: SafeArea(
            child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: temp[mapindex]!.length,
          itemBuilder: (context, index) {
            return GymWorkoutsGrid(
              innermapindex: index,
              mapindex: mapindex,
            );
          },
        )));
  }
}

class GymWorkoutsGrid extends StatelessWidget {
  final String mapindex;
  final int innermapindex;
  GymWorkoutsGrid(
      {super.key, required this.innermapindex, required this.mapindex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return StepsWorkouts(
                innermapindex: innermapindex,
                mapindex: mapindex,
              );
            },
          ));
        },
        child: Container(
            color: Colors.grey[900],
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          temp[mapindex]![innermapindex]![1],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Container(
                      color: Colors.grey[900],
                      child: Center(
                          child: Text(temp[mapindex]![innermapindex]![0]))),
                ),
              ],
            )),
      ),
    );
  }
}
