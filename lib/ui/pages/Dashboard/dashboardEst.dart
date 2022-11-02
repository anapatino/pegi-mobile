import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/widgets/ProgressAvatar.dart';

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
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Color.fromRGBO(91, 59, 183, 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 80, right: 80, top: 60, bottom: 60),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 50),
                                  child: Column(children: const [
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.edit_note_sharp)),
                                    SizedBox(height: 10),
                                    Text(
                                      "2 Abril",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                          backgroundColor:
                                              Color.fromRGBO(33, 150, 243, 1),
                                          color: Color.fromARGB(
                                              255, 221, 221, 221)),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(width: 35),
                  Column(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Color.fromRGBO(18, 180, 122, 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 75, vertical: 40),
                                      child: Column(children: const [
                                        IconButton(
                                            onPressed: null,
                                            icon: Icon(Icons.edit_note_sharp)),
                                        SizedBox(height: 10),
                                        Text(
                                          "2 Abril",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.0,
                                              backgroundColor: Color.fromRGBO(
                                                  33, 150, 243, 1),
                                              color: Color.fromARGB(
                                                  255, 221, 221, 221)),
                                        ),
                                      ]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: 20),
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Color.fromRGBO(33, 150, 243, 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 75, vertical: 30),
                                  child: Column(children: const [
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.edit_note_sharp)),
                                    SizedBox(height: 10),
                                    Text(
                                      "2 Abril",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                          backgroundColor:
                                              Color.fromRGBO(33, 150, 243, 1),
                                          color: Color.fromARGB(
                                              255, 221, 221, 221)),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          )),
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
