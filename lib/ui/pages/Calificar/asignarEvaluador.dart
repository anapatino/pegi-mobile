import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/Header.dart';

import '../../widgets/Mostrar.dart';

const List<String> list = <String>['Alex vacca', 'Amil', 'Three'];

class AsignarEvaluador extends StatefulWidget {
  const AsignarEvaluador({super.key});

  @override
  State<AsignarEvaluador> createState() => _AsignarEvaluadorState();
}

class _AsignarEvaluadorState extends State<AsignarEvaluador> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Asignar Evaluador'),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'pendiente',
                onPressed: () {},
                color: Colors.black,
                fijarIcon: false,
                padding: const EdgeInsets.only(left: 10, right: 25.0, top: 20)),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                height: 3,
                width: 350,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                  ),
                ),
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
              borderRadius: BorderRadius.circular(20),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
