import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

class Botones extends StatefulWidget {
  final String texto;
  const Botones({super.key, required this.texto});

  @override
  State<Botones> createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Cancelar",
                style: GoogleFonts.kodchasan(
                  color: Colors.white,
                  fontSize: 14,
                )),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              minimumSize:
                  Size(Dimensiones.width5, Dimensiones.screenHeight * 0.05),
            ),
          ),
          SizedBox(width: Dimensiones.screenWidth * 0.02),
          ElevatedButton(
            onPressed: () {},
            child: Text(widget.texto,
                style: GoogleFonts.kodchasan(
                  color: Colors.white,
                  fontSize: 14,
                )),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(91, 59, 183, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              minimumSize:
                  Size(Dimensiones.width5, Dimensiones.screenHeight * 0.05),
            ),
          ),
        ],
      ),
    );
  }
}
