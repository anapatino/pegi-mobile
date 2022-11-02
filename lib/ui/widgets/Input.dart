import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  final TextEditingController controlador;
  final String texto;
  final bool esContrasena;
  Color? colorF;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color colorText;

  Input(this.esContrasena, this.controlador, this.texto, this.margin,
      this.padding, this.colorText, this.colorF,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: TextField(
          cursorColor: Colors.black,
          obscureText: esContrasena,
          autofocus: false,
          controller: controlador,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 30),
            filled: true,
            fillColor: colorF,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusColor: colorText,
            labelText: texto,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 16,
              color: colorText,
            ),
          )),
    );
  }
}
