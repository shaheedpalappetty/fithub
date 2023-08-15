import 'package:flutter/material.dart';
import 'package:workout_app/services/db_helper.dart';
import 'package:workout_app/sign_up.dart';
import 'package:workout_app/widgets/text_field_widget.dart';

import 'parent_file.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Dwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: Form(
        // autovalidateMode: AutovalidateMode.always,
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Center(
                  child: Text(
                'Login to your Account',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
            TextFieldWidget(
              hintText: 'Username',
              icon: Icon(Icons.person),
              validation: (value) {
                if (value.isEmpty) {
                  return 'Username is Required';
                } else {
                  return null;
                }
              },
              controller: _usernameController,
            ),
            TextFieldWidget(
              hintText: 'Enter password here',
              icon: Icon(Icons.security),
              validation: (value) {
                if (value.isEmpty) {
                  return 'Password is Required';
                } else {
                  return null;
                }
              },
              controller: _passwordController,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                alignment: Alignment(0, -.7),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        String username = _usernameController.text.trim();
                        String password = _passwordController.text.trim();
                        final userDetails = await DatabaseHelper.instance
                            .login(username, password);

                        if (userDetails.isNotEmpty) {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return BottomNav(
                                userDetails: userDetails,
                              );
                            },
                          ), (route) => false);
                        } else {
                          print('showDialog');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  'Error!!!',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content:
                                    Text('Username or Password Doesn\'t Match'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(Dwidth, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont\'t have an Account?'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SignUp();
                        },
                      ));
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ))
              ],
            ),
            SizedBox(
              height: 35,
            )
          ],
        ),
      )),
    );
  }
}
