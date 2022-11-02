import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Filter extends StatelessWidget {
  final TextEditingController controlador;
  String texto;
  Filter({Key? key, required this.controlador, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(texto,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            Expanded(
              child: TextField(
                  controller: controlador,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromRGBO(113, 77, 217, 1),
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 30),
                    filled: true,
                    fillColor: const Color.fromRGBO(30, 30, 30, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  )),
            ),
          ],
        ),
        Container(
          height: 60,
          width: 350,
          decoration: const BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
            ),
          ),
        ),
      ],
    );
  }
}
