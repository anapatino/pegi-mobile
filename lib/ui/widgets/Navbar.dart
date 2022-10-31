import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  final String rol;
  String icono;
  Navbar(this.rol, this.icono);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
      child: Column(
        children: [
          Row(children: [
            IconButton(
              onPressed: () {},
              icon: Image(
                image: AssetImage('assets/icons/$icono'),
                width: 30,
                height: 30,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.sunny, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: Colors.white))
          ]),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hola, ' + rol,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 5),
              Text('sé productivo hoy',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
