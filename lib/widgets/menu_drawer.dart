import 'dart:io';

import 'package:flutter/material.dart';

import 'package:workout_app/services/db_helper.dart';

import '../screens/login_page.dart';
import 'drawertile.dart';

class MenuDrawer extends StatelessWidget {
  final userDetails;
  const MenuDrawer({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    TextStyle color1 = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xff7958FE),
                ),
              ),
              Center(
                heightFactor: 1.4,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.file(
                        File(userDetails!['userImage']),
                      ).image,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${userDetails!['userName']}'.toUpperCase(),
                      style: color1,
                    ),
                    Text(
                      '${userDetails!['userEmail']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
          DrawerTile(onTap: () {}, iconn: Icons.settings, texxt: 'Settings'),
          DrawerTile(iconn: Icons.delete, texxt: 'Clear App Data'),
          DrawerTile(iconn: Icons.info, texxt: 'App info'),
          DrawerTile(iconn: Icons.receipt_long, texxt: 'Terms & Conditions'),
          DrawerTile(iconn: Icons.gavel_sharp, texxt: 'Privacy & Policy'),
          DrawerTile(iconn: Icons.live_help, texxt: 'Help'),
          DrawerTile(
              onTap: () {
                signoutConfirmation(context);
              },
              colrr: const Color.fromARGB(181, 244, 67, 54),
              iconn: Icons.logout,
              texxt: 'SignOut'),
        ],
      ),
    );
  }

  signoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 20),
                  child: Text(
                    'Logout your account',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    DatabaseHelper.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
