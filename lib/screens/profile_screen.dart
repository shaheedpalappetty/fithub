import 'dart:io';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userDetails;

  const ProfileScreen({Key? key, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            CircleAvatar(
              backgroundImage: FileImage(
                File(
                  userDetails['userImage'],
                ),
              ),
              backgroundColor: Colors.deepPurple,
              radius: 70,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userDetails.length - 2,
                  itemBuilder: (context, index) {
                    String key = mapKeysFromIndex(userDetails, index);
                    String newkey = key.replaceFirst('user', '');
                    if (key == 'userImage' || key == 'userId') {
                      return SizedBox
                          .shrink(); // Return an empty widget to avoid rendering
                    } else if (key == 'userAge' ||
                        key == 'userWeight' ||
                        key == 'userHeight') {
                      return ListTile(
                        leading: Text(newkey.toUpperCase()),
                        trailing: Text(userDetails[key].toString()),
                      );
                    } else {
                      return ListTile(
                        leading: Text(newkey.toUpperCase()),
                        trailing: Text(userDetails[key]),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String mapKeysFromIndex(Map<String, dynamic> map, int index) {
  List<String> keys = map.keys.toList();
  if (index >= 0 && index < keys.length) {
    return keys[index];
  }
  return '';
}
