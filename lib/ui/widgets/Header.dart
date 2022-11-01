import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  IconData icon;
  String texto;

  Header({Key? key, required this.icon, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: Icon(icon, size: 20, color: Colors.white),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.sunny, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: Colors.white))
          ]),
        ),
        Text(
          texto,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
