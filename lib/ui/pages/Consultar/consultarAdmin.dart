import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/consultar/evaluadorPropuesta.dart';
import 'package:pegi/ui/pages/consultar/evaluadorProyecto.dart';

import '../../widgets/Consulta.dart';

class ConsultarAdmin extends StatelessWidget {
  const ConsultarAdmin({super.key});

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
                        icon: const Icon(Icons.notifications,
                            color: Colors.white))
                  ]),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Consultar(
                icon: Icons.folder_shared_rounded,
                texto: 'Propuesta \nEvaluadores',
                colorBoton: const Color.fromRGBO(18, 180, 122, 1),
                onPressed: () {
                  Get.to(() => const EvaluadorPropuesta());
                }),
            const SizedBox(height: 30),
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
