import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Input extends StatelessWidget {
  final TextEditingController controlador;
  final String texto;
  final bool esContrasena;
  Color? colorF;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color colorText;

  Input(this.esContrasena, this.controlador, this.texto, this.margin,
      this.padding, this.colorF, this.colorText,
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
          style: TextStyle(color: colorText),
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

class InputMedium extends StatelessWidget {
  final TextEditingController controlador;
  final String texto;
  Color? colorF;
  Color? colorText;
  EdgeInsets? padding;

  InputMedium(
      this.controlador, this.texto, this.padding, this.colorText, this.colorF,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextField(
          cursorColor: colorText,
          autofocus: false,
          maxLines: 8,
          controller: controlador,
          style: TextStyle(color: colorText),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Dimensiones.screenWidth * 0.08,
                vertical: Dimensiones.screenHeight * 0.03),
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
