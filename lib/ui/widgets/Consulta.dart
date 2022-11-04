import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Consultar extends StatefulWidget {
  final String texto;
  final Color colorBoton;
  final VoidCallback onPressed;
  final IconData icon;

  const Consultar({
    super.key,
    required this.icon,
    required this.texto,
    required this.colorBoton,
    required this.onPressed,
  });

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensiones.width5),
              child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: widget.colorBoton,
                  onPressed: () {
                    widget.onPressed();
                  },
                  height: Dimensiones.height15,
                  child: Padding(
                    padding: EdgeInsets.all(Dimensiones.screenWidth * 0.02),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensiones.screenWidth * 0.02,
                              right: Dimensiones.screenWidth * 0.04),
                          child:
                              Icon(widget.icon, size: 40, color: Colors.white),
                        ),
                        Text(widget.texto,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
