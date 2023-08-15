import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  Icon icon;
  FormFieldValidator validation;

  TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.validation,
      required this.controller});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validation,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          prefixIconColor: Colors.white,
          filled: true,
          fillColor: Color(0x5AFFFFFF),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
