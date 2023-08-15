import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workout_app/styles/fonts.dart';

import 'screens/sign_up_pages/signup1.dart';
import 'screens/sign_up_pages/signup2.dart';
import 'screens/sign_up_pages/signup3.dart';

import 'screens/user_details.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //track page no
  final PageController _controller = PageController();

  //track last page
  bool onLastPage = false;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                page = index;
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [SignUp1(), SignUp2(), SignUp3()],
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmoothPageIndicator(
                    effect: const WormEffect(
                        dotColor: Color.fromARGB(161, 152, 137, 176),
                        activeDotColor: Color.fromARGB(255, 255, 255, 255)),
                    controller: _controller,
                    count: 3,
                  ),
                  page < 2
                      ? Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(200, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              onPressed: () {
                                _controller.jumpToPage(2);
                              },
                              child: const Text(
                                'Skip',
                                style: CustomFontStyles.title4,
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 15,
                  ),
                  onLastPage
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                              builder: (context) {
                                return UserDetails();
                              },
                            ), (route) => false);
                          },
                          child: const Text(
                            'Start',
                            style: CustomFontStyles.title4,
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            'Next',
                            style: CustomFontStyles.title4,
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
