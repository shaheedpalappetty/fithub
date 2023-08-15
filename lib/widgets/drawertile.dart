import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerTile extends StatelessWidget {
  DrawerTile(
      {super.key,
      this.onTap,
      required this.iconn,
      required this.texxt,
      this.colrr});
  Function()? onTap;
  final IconData iconn;
  final String texxt;
  Color? colrr;
  @override
  Widget build(BuildContext context) {
    Color BlackColor = Color.fromARGB(255, 255, 255, 255);
    return ListTile(
      onTap: onTap,
      leading: Icon(iconn, color: colrr ?? BlackColor),
      title: Text(
        texxt,
        style: TextStyle(
          color: colrr ?? BlackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
