import 'package:flutter/material.dart';

class WidgetConsultaPropuesta extends StatefulWidget {
  const WidgetConsultaPropuesta({super.key});

  @override
  State<WidgetConsultaPropuesta> createState() =>
      _WidgetConsultaPropuestaState();
}

class _WidgetConsultaPropuestaState extends State<WidgetConsultaPropuesta> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Color.fromRGBO(19, 181, 122, 1)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(children: [
                IconButton(
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
                      Text('\nConsultar \nPropuestas',
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
