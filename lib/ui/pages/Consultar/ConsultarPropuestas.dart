import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import '../../widgets/Filter.dart';
import '../../widgets/Header.dart';
import '../Calificar/CalificarPropuestas.dart';

class MostrarPropuesta extends StatefulWidget {
  const MostrarPropuesta({super.key});

  @override
  State<MostrarPropuesta> createState() => _MostrarPropuestaState();
}

class _MostrarPropuestaState extends State<MostrarPropuesta> {
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
                      texto: 'Consultar Propuestas'),
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
                  Get.to(() => const CalificarPropuestas());
                },
                color: const Color.fromRGBO(30, 30, 30, 1),
                fijarIcon: true,
                icon: Icons.edit_outlined,
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 20)),
            const SizedBox(height: 5),
            MostrarTodo(
              texto: 'Harina base de \ninsectos.',
              colorBoton: const Color.fromRGBO(26, 185, 127, 1),
              estado: true,
              tipo: 'calificado',
              onPressed: () {
                Get.to(() => const CalificarPropuestas());
              },
              color: const Color.fromRGBO(30, 30, 30, 1),
              fijarIcon: true,
              icon: Icons.edit_outlined,
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20),
            ),
          ],
        ),
      ),
    );
  }
}
