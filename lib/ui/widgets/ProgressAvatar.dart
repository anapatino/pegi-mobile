import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressAvatar extends StatefulWidget {
  final String label;
  final String seguimiento;
  final double porcentaje; //
  final Color color;
  final String texto;
  const ProgressAvatar(
      {super.key,
      required this.texto,
      required this.seguimiento,
      required this.label,
      required this.porcentaje,
      required this.color});

  @override
  State<ProgressAvatar> createState() => _ProgressAvatarState();
}

class _ProgressAvatarState extends State<ProgressAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Color.fromRGBO(30, 30, 30, 1)),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 10.0,
                    animation: true,
                    percent: widget.porcentaje,
                    center: Text(
                      widget.label,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: widget.color,
                    backgroundColor: const Color.fromRGBO(65, 65, 68, 1),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.texto,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.seguimiento,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ]))),
    );
  }
}
