import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/calificar/asignarEvaluador.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';
import '../../widgets/Mostrar.dart';

class EvaluadorPropuesta extends StatefulWidget {
  const EvaluadorPropuesta({super.key});

  @override
  State<EvaluadorPropuesta> createState() => _EvaluadorPropuestaState();
}

class _EvaluadorPropuestaState extends State<EvaluadorPropuesta> {
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Evaluadores Propuesta'),
            Filter(controlador: controlador, texto: 'Filtrar'),
            const SizedBox(height: 5),
            MostrarTodo(
              texto: 'Harina base de \ninsectos.',
              colorBoton: const Color.fromRGBO(91, 59, 183, 1),
              estado: true,
              tipo: 'pendiente',
              onPressed: () {
                Get.to(() => const AsignarEvaluador());
              },
              color: const Color.fromRGBO(30, 30, 30, 1),
              fijarIcon: true,
              icon: Icons.edit_outlined,
            ),
            const SizedBox(height: 5),
            MostrarTodo(
              texto: 'Harina base de \ninsectos.',
              colorBoton: const Color.fromRGBO(26, 185, 127, 1),
              estado: true,
              tipo: 'calificado',
              onPressed: () {
                Get.to(() => const AsignarEvaluador());
              },
              color: const Color.fromRGBO(30, 30, 30, 1),
              fijarIcon: true,
              icon: Icons.edit_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
