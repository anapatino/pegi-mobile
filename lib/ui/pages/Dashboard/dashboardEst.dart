import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pegi/ui/widgets/ProgressAvatar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/Dimensiones.dart';
import '../../widgets/Navbar.dart';

class DashboardEstudiante extends StatefulWidget {
  const DashboardEstudiante({super.key});

  @override
  State<DashboardEstudiante> createState() => _DashboardEstudianteState();
}

class _DashboardEstudianteState extends State<DashboardEstudiante> {
  final today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar("Estudiante", Icons.space_dashboard),
              ProgressAvatar(
                tieneFecha: true,
                fecha: '2 abril',
                porcentaje: 0.3,
                color: const Color.fromRGBO(33, 150, 243, 1),
                label: '30%',
                texto: 'Proyectos \ncalificadas',
                seguimiento: '8/16 revisiones',
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensiones.width5,
                    vertical: Dimensiones.screenHeight * 0.03),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: Dimensiones.screenWidth * 0.45,
                        height: Dimensiones.screenHeight * 0.37,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Color.fromRGBO(91, 59, 183, 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensiones.screenHeight * 0.010,
                                  horizontal: Dimensiones.screenWidth * 0.04),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.edit_note_sharp,
                                      size: Dimensiones.screenWidth * 0.09,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    SizedBox(
                                        height:
                                            Dimensiones.screenHeight * 0.015),
                                    Text(
                                      "Editar Propuesta",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          color: const Color.fromARGB(
                                              255, 221, 221, 221)),
                                    ),
                                    SizedBox(
                                        height:
                                            Dimensiones.screenHeight * 0.015),
                                    Text(
                                      "Recuerda que si editas tu propuesta en estado de revision  perderas todo el proceso.",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12.0,
                                          color: const Color.fromARGB(
                                              255, 221, 221, 221)),
                                    ),
                                    SizedBox(
                                      height: Dimensiones.screenHeight * 0.05,
                                    ),
                                    LinearPercentIndicator(
                                      lineHeight: 9,
                                      animation: true,
                                      percent: 0.8,
                                      barRadius: const Radius.circular(4.0),
                                      progressColor:
                                          const Color.fromRGBO(33, 150, 243, 1),
                                      backgroundColor:
                                          const Color.fromRGBO(65, 65, 68, 1),
                                    ),
                                    SizedBox(
                                      height: Dimensiones.screenHeight * 0.015,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensiones.screenWidth * 0.025,
                                          right:
                                              Dimensiones.screenWidth * 0.025),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "En progreso",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromARGB(
                                                    255, 221, 221, 221)),
                                          ),
                                          Text(
                                            "80%",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromARGB(
                                                    255, 221, 221, 221)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            )
                          ],
                        )),
                    SizedBox(width: Dimensiones.screenWidth * 0.03),
                    Column(
                      children: [
                        Container(
                          width: Dimensiones.screenWidth * 0.30,
                          height: Dimensiones.screenHeight * 0.20,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Color.fromRGBO(18, 180, 122, 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensiones.screenHeight * 0.010,
                                    horizontal:
                                        Dimensiones.screenWidth * 0.025),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.edit_note_sharp,
                                        size: Dimensiones.screenWidth * 0.08,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      Text(
                                        "Estado del proyecto",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 221, 221, 221)),
                                      ),
                                      SizedBox(
                                        height: Dimensiones.screenHeight * 0.03,
                                      ),
                                      LinearPercentIndicator(
                                        lineHeight: 9,
                                        animation: true,
                                        percent: 0.8,
                                        barRadius: const Radius.circular(4.0),
                                        progressColor: const Color.fromRGBO(
                                            33, 150, 243, 1),
                                        backgroundColor:
                                            const Color.fromRGBO(65, 65, 68, 1),
                                      ),
                                      SizedBox(
                                        height: Dimensiones.screenHeight * 0.01,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Dimensiones.screenWidth * 0.015,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "progreso",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromARGB(
                                                      255, 221, 221, 221)),
                                            ),
                                            Text(
                                              "80%",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromARGB(
                                                      255, 221, 221, 221)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensiones.screenHeight * 0.01,
                        ),
                        Container(
                          width: Dimensiones.screenWidth * 0.30,
                          height: Dimensiones.screenHeight * 0.16,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Color.fromRGBO(33, 150, 243, 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Dimensiones.screenHeight * 0.025,
                                    left: Dimensiones.screenWidth * 0.050,
                                    right: Dimensiones.screenWidth * 0.050),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: Dimensiones.screenWidth * 0.04,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      Text(
                                        DateFormat.yMMM('en_US')
                                            .format(today)
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 221, 221, 221)),
                                      ),
                                    ]),
                              ),
                              Text(
                                DateFormat.d('en_US').format(today).toString(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                              ),
                              Text(
                                DateFormat.EEEE('en_US')
                                    .format(today)
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 221, 221, 221)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
