import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../widgets/Filter.dart';
import '../../widgets/Header.dart';
import '../Calificar/CalificarPropuestas.dart';
import '../calificar/calificarProyectos.dart';

class MostrarProyectos extends StatefulWidget {
  const MostrarProyectos({super.key});

  @override
  State<MostrarProyectos> createState() => _MostrarProyectosState();
}

class _MostrarProyectosState extends State<MostrarProyectos> {
  TextEditingController controlador = TextEditingController();
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
                  Header(
                      icon: Icons.arrow_back_rounded,
                      texto: 'Consultar Proyectos'),
                  Filter(controlador: controlador, texto: 'Filtrar'),
                ],
              ),
            ),
            const SizedBox(height: 5),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'pendiente',
                onPressed: () {
                  Get.to(() => const CalificarProyectos());
                }),
            const SizedBox(height: 5),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'pendiente',
                onPressed: () {
                  Get.to(() => const CalificarProyectos());
                }),
            const SizedBox(height: 5),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(26, 185, 127, 1),
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
