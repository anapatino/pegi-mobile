import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/Consultar/consultarDocente.dart';
import 'package:pegi/ui/pages/home.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../Calificar/CalificarPropuestas.dart';

class Mostrar extends StatefulWidget {
  const Mostrar({super.key});

  @override
  State<Mostrar> createState() => _MostrarState();
}

class _MostrarState extends State<Mostrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sunny, color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.white))
                  ]),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Consultar Propuesta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Filtar", style: TextStyle(color: Colors.white)),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(30, 30, 30, 1),
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(30, 30, 30, 1),
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3))
                                ]),
                            child: const TextField(
                                decoration: InputDecoration(
                              border: InputBorder.none,
                            ))),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 5,
                    indent: 6,
                    color: Color.fromRGBO(30, 30, 30, 1),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'pendiente',
                onPressed: () {
                  Get.to(() => const CalificarPropuestas());
                }),
            const SizedBox(height: 5),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'pendiente',
                onPressed: () {
                  Get.to(() => const CalificarPropuestas());
                }),
            const SizedBox(height: 5),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: Color.fromRGBO(26, 185, 127, 1),
                estado: true,
                tipo: 'Calificada',
                onPressed: () {
                  Get.to(() => const CalificarPropuestas());
                }),
          ],
        ),
      ),
    );
  }
}
