import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/calificar/calificarTodo.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import '../../widgets/Filter.dart';
import '../../widgets/Header.dart';

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
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
          child: SingleChildScrollView(
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
                SizedBox(height: Dimensiones.height5),
                MostrarTodo(
                    texto: 'Harina base de \ninsectos.',
                    colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                    estado: true,
                    tipo: 'pendiente',
                    onPressed: () {
                      Get.to(() => const CalificarT());
                    },
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    fijarIcon: true,
                    icon: Icons.edit_outlined,
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 20)),
                MostrarTodo(
                    texto: 'Harina base de \ninsectos.',
                    colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                    estado: true,
                    tipo: 'pendiente',
                    onPressed: () {
                      Get.to(() => const CalificarT());
                    },
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    fijarIcon: true,
                    icon: Icons.edit_outlined,
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 20)),
              ],
            ),
          )),
    );
  }
}
