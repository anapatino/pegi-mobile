import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calificar extends StatefulWidget {
  final TextEditingController controlador;
  final TextEditingController control;
  const Calificar({
    super.key,
    required this.controlador,
    required this.control,
  });

  @override
  State<Calificar> createState() => _CalificarState();
}

class _CalificarState extends State<Calificar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                    maxLines: 8,
                    controller: widget.controlador,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: const Color.fromRGBO(113, 77, 217, 1),
                    textAlign: TextAlign.start,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Retroalimentacion",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.white),
                      contentPadding: const EdgeInsets.only(left: 3),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      controller: widget.control,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: const Color.fromRGBO(113, 77, 217, 1),
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Calificacion",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.white),
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
          )
        ],
      ),
    );
  }
}
