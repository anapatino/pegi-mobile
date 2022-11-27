import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class MostrarTodo extends StatefulWidget {
  final String texto;
  final IconData? icon;
  final EdgeInsets padding;
  bool fijarIcon;
  final bool? estado;
  final String? tipo;
  final Color colorBoton;
  final Color color;
  final VoidCallback onPressed;
  MostrarTodo(
      {super.key,
      required this.texto,
      this.tipo,
      this.estado = false,
      required this.colorBoton,
      required this.onPressed,
      required this.color,
      required this.fijarIcon,
      this.icon,
      required this.padding});

  @override
  State<MostrarTodo> createState() => _MostrarTodoState();
}

class _MostrarTodoState extends State<MostrarTodo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensiones.screenHeight * 0.02,
          horizontal: Dimensiones.screenWidth * 0.001),
      child: Container(
          height: Dimensiones.screenHeight * 0.18,
          width: Dimensiones.width90,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: widget.color),
          child: Padding(
              padding: widget.padding,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: Dimensiones.screenHeight * 0.019),
                          child: SizedBox(
                            width: Dimensiones.width60,
                            child: Text(
                              widget.texto,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                            child: widget.estado == false
                                ? Container()
                                : Container(
                                    width: Dimensiones.screenWidth * 0.25,
                                    height: Dimensiones.screenHeight * 0.03,
                                    padding: const EdgeInsets.only(top: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(80),
                                          bottomRight: Radius.circular(80),
                                          topLeft: Radius.circular(80),
                                          topRight: Radius.circular(80)),
                                      color: widget.colorBoton,
                                    ),
                                    child: Text(
                                      widget.tipo.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                          color: Color.fromARGB(
                                              255, 221, 221, 221)),
                                    ),
                                  )),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: widget.fijarIcon == false
                          ? Container()
                          : IconButton(
                              onPressed: () {
                                widget.onPressed();
                              },
                              icon: Icon(widget.icon,
                                  size: 37,
                                  color: const Color.fromRGBO(91, 59, 183, 1))),
                    )
                  ]))),
    );
  }
}
