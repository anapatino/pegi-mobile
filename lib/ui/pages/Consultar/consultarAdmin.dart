import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/consultar/evaluadorPropuesta.dart';
import 'package:pegi/ui/pages/consultar/evaluadorProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

import '../../widgets/Consulta.dart';

class ConsultarAdmin extends StatelessWidget {
  const ConsultarAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensiones.width5, vertical: Dimensiones.height5),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/icons/archivo.png'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sunny, color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.notifications, color: Colors.white))
                ]),
              ],
            ),
            SizedBox(height: Dimensiones.height5),
            Consultar(
                icon: Icons.folder_shared_rounded,
                texto: 'Propuesta \nEvaluadores',
                colorBoton: const Color.fromRGBO(18, 180, 122, 1),
                onPressed: () {
                  Get.to(() => const EvaluadorPropuesta());
                }),
            SizedBox(height: Dimensiones.height5),
            Consultar(
                icon: Icons.folder_shared_rounded,
                texto: 'Proyecto \nEvaluadores',
                colorBoton: const Color.fromRGBO(33, 153, 245, 1),
                onPressed: () {
                  Get.to(
                    () => const EvaluadorProyecto(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
