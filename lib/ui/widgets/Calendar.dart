import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final today = DateTime.now();
  final yesterday = DateTime.now().subtract(Duration(days: 1));
  final tomorrow = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                DateFormat.d('en_US').format(yesterday).toString(),
                style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(65, 65, 65, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Dimensiones.screenHeight * 0.01),
              Text(DateFormat.E('en_US').format(yesterday).toString(),
                  style: GoogleFonts.montserrat(
                      color: const Color.fromRGBO(65, 65, 65, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
            ],
          ),
          Column(
            children: [
              Text(
                DateFormat.yMMM('en_US').format(today).toString(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Dimensiones.screenHeight * 0.00012),
              Text(
                DateFormat.d('en_US').format(today).toString(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Dimensiones.screenHeight * 0.01),
              Text(DateFormat.E('en_US').format(today).toString(),
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
            ],
          ),
          Column(
            children: [
              Text(
                DateFormat.d('en_US').format(tomorrow).toString(),
                style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(65, 65, 65, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Dimensiones.screenHeight * 0.01),
              Text(DateFormat.E('en_US').format(tomorrow).toString(),
                  style: GoogleFonts.montserrat(
                      color: const Color.fromRGBO(65, 65, 65, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _date(bool isDate, DateTime day) {
  return Column(
    children: [
      isDate == false
          ? Container()
          : Padding(
              padding:
                  EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.00012),
              child: Text(
                DateFormat.yMMM('en_US').format(day).toString(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
      Text(
        DateFormat.d('en_US').format(day).toString(),
        style: GoogleFonts.montserrat(
            color: Colors.white, fontSize: 42, fontWeight: FontWeight.w600),
      ),
      SizedBox(height: Dimensiones.screenHeight * 0.01),
      Text(DateFormat.E('en_US').format(day).toString(),
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
    ],
  );
}
