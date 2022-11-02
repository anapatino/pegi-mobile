import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: widget.colorBoton,
                  onPressed: () {
                    widget.onPressed();
                  },
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 20),
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
