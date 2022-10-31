import 'package:flutter/material.dart';

import '../../widgets/ConsultaPropuestas.dart';
import '../../widgets/ConsultaProyectos.dart';

class Consultar extends StatefulWidget {
  const Consultar({super.key});

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
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
            const WidgetConsultaPropuesta(),
            const SizedBox(height: 30),
            const WidgetConsultaProyectos(),
          ],
        ),
      ),
    );
  }
}
