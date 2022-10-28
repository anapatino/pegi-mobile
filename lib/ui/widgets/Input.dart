import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  Color? colorFill;
  EdgeInsets? margin;
  EdgeInsets? padding;

  Color colorText;
  Input(this.isPassword, this.controller, this.label, this.margin, this.padding,
      this.colorText, this.colorFill);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: TextField(
          obscureText: isPassword,
          autofocus: false,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 30),
            filled: true,
            fillColor: colorFill,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusColor: colorText,
            labelText: label,
            labelStyle: TextStyle(
              color: colorText,
            ),
          )),
    );
  }
}
