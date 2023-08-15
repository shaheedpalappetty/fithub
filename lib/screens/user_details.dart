import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workout_app/screens/login_page.dart';
import 'package:workout_app/styles/fonts.dart';
import 'package:workout_app/services/db_helper.dart';
import '../widgets/text_field_widget.dart';
import 'details_pages/about.dart';

class UserDetails extends StatefulWidget {
  UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image;
  bool _imageCheck = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text('Gallery'),
                                onTap: () {
                                  _imageSelectorGallery();
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text('Camera'),
                                onTap: () {
                                  _imageSelectorCamera();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: (!_imageCheck)
                      ? CircleAvatar(
                          backgroundColor: Colors.deepPurple[300],
                          radius: 80,
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(_image!),
                        ),
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  controller: _usernameController,
                  hintText: 'Username',
                  icon: Icon(Icons.person),
                  validation: (value) {
                    if (value.isEmpty ||
                        _usernameController.text.trim().isEmpty ||
                        RegExp(r'^[a-zA-Z0-9]$').hasMatch(value!)) {
                      return 'Enter Correct Name';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFieldWidget(
                  controller: _passwordController,
                  hintText: 'Password',
                  icon: Icon(Icons.security),
                  validation: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$")
                            .hasMatch(value)) {
                      return 'Enter Correct Password';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFieldWidget(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  icon: Icon(Icons.security),
                  validation: (value) {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      return 'Password does not Match';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFieldWidget(
                  controller: _emailController,
                  hintText: 'Email',
                  icon: Icon(Icons.alternate_email),
                  validation: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                            .hasMatch(value)) {
                      return 'Enter Valid Email';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_image == null) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  'Error!!!',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text('Please select an image.'),
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
                          return; // Exit the onPressed callback to prevent further execution
                        }

                        print('Validation');
                        String username = _usernameController.text;
                        bool isUsernameTaken = await DatabaseHelper.instance
                            .checkUsernameAvailability(username);

                        if (!isUsernameTaken) {
                          print('Username taken');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  'Error!!!',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text(
                                  'Username Already taken. Please choose a different username.',
                                ),
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
                        } else {
                          print('Adding to db');
                          Map<String, dynamic> userDetails = {
                            DatabaseHelper.columnName: username,
                            DatabaseHelper.columnPassword:
                                _passwordController.text,
                            DatabaseHelper.columnEmail: _emailController.text,
                            DatabaseHelper.columnImage: _image!.path,
                          };
                          print(userDetails);
                          int result = await DatabaseHelper.instance
                              .addUserDetails(userDetails);
                          if (result != -1) {
                            DatabaseHelper.instance.getAllUserDetails();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return About(userDetails: userDetails);
                                // About(userDetails: userDetails);
                              },
                            ));
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: Text(
                                    'Error!!!',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: Text(
                                      'Failed to add user details to the database.'),
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
                      } else {
                        print("Not Validating");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(deviceWidth, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Signup',
                      style: CustomFontStyles.title4,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ));
                      },
                      child: Text(
                        'Login here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _imageSelectorGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePath =
        await picker.pickImage(source: ImageSource.gallery);

    if (imagePath != null) {
      setState(() {
        _imageCheck = true;
        _image = File(imagePath.path);
      });
    }
  }

  Future<void> _imageSelectorCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePath = await picker.pickImage(source: ImageSource.camera);

    if (imagePath != null) {
      setState(() {
        _imageCheck = true;
        _image = File(imagePath.path);
      });
    }
  }
}
