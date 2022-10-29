import 'package:flutter/material.dart';

class WidgetConsultaProyectos extends StatefulWidget {
  const WidgetConsultaProyectos({super.key});

  @override
  State<WidgetConsultaProyectos> createState() =>
      _WidgetConsultaProyectosState();
}

class _WidgetConsultaProyectosState extends State<WidgetConsultaProyectos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Color.fromRGBO(33, 150, 243, 1)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(children: [
                IconButton(
                    alignment: Alignment.bottomLeft,
                    onPressed: () {},
                    icon: const Icon(Icons.folder,
                        color: Colors.white, size: 50)),
                const SizedBox(
                  width: 50,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('\nConsultar \nProyectos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ]))),
    );
  }
}
