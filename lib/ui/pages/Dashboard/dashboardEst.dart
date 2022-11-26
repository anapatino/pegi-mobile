import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
            top: Dimensiones.screenHeight * 0.03,
            left: Dimensiones.screenWidth * 0.05,
            right: Dimensiones.screenWidth * 0.05),
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
              padding: EdgeInsets.only(
                  left: Dimensiones.screenWidth * 0.055,
                  right: Dimensiones.screenWidth * 0.05,
                  top: Dimensiones.screenHeight * 0.020),
              child: Row(
                children: [
                  Container(
                      width: Dimensiones.screenWidth * 0.38,
                      height: Dimensiones.screenHeight * 0.40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Color.fromRGBO(91, 59, 183, 1)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensiones.screenHeight * 0.010,
                                horizontal: Dimensiones.screenWidth * 0.02),
                            child: Column(children: [
                              Row(children: [
                                Icon(
                                  Icons.edit_note_sharp,
                                  size: Dimensiones.screenWidth * 0.08,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ]),
                              SizedBox(
                                  height: Dimensiones.screenHeight * 0.015),
                              Row(
                                children: const [
                                  Text(
                                    "Editar Propuesta",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color:
                                            Color.fromARGB(255, 221, 221, 221)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: Dimensiones.screenHeight * 0.015),
                              const Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  "Recuerda que si editas tu propuesta en estado de revision  perderas todo el proceso.",
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color:
                                          Color.fromARGB(255, 221, 221, 221)),
                                ),
                              ),
                              SizedBox(
                                height: Dimensiones.screenHeight * 0.08,
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
                                    right: Dimensiones.screenWidth * 0.025),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "En progreso",
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
                      )),
                  SizedBox(width: Dimensiones.screenWidth * 0.03),
                  Column(
                    children: [
                      Container(
                        width: Dimensiones.screenWidth * 0.28,
                        height: Dimensiones.screenHeight * 0.20,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Color.fromRGBO(18, 180, 122, 1)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensiones.screenHeight * 0.010,
                                  horizontal: Dimensiones.screenWidth * 0.02),
                              child: Column(children: [
                                Row(children: [
                                  Icon(
                                    Icons.edit_note_sharp,
                                    size: Dimensiones.screenWidth * 0.08,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ]),
                                const Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Estado del proyecto",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color:
                                            Color.fromARGB(255, 221, 221, 221)),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensiones.screenHeight * 0.03,
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
                                      right: Dimensiones.screenWidth * 0.025),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "En progreso",
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
                        height: Dimensiones.screenHeight * 0.03,
                      ),
                      Container(
                        width: Dimensiones.screenWidth * 0.28,
                        height: Dimensiones.screenHeight * 0.16,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Color.fromRGBO(33, 150, 243, 1)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensiones.screenHeight * 0.025,
                                  horizontal: Dimensiones.screenWidth * 0.04),
                              child: Column(children: [
                                Row(children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: Dimensiones.screenWidth * 0.03,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  const Text(
                                    "Sep, 2022",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color:
                                            Color.fromARGB(255, 221, 221, 221)),
                                  ),
                                ]),
                                const Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 32.0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                const Text(
                                  "Jueves",
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color:
                                          Color.fromARGB(255, 221, 221, 221)),
                                ),
                              ]),
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
    );
  }
}
