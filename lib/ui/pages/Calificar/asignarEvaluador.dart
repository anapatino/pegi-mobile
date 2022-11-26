import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Button.dart';

import '../../utils/Dimensiones.dart';
import '../../widgets/Mostrar.dart';

const List<String> list = <String>['Alex vacca', 'Amilkar', 'Roberto'];

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
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensiones.screenWidth * 0.03,
                    vertical: Dimensiones.screenHeight * 0.01)),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensiones.height5),
              child: Container(
                height: Dimensiones.screenHeight * 0.0001,
                width: Dimensiones.width90,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                  ),
                ),
              ),
            ),
            Container(
              width: Dimensiones.width80,
              height: Dimensiones.screenHeight * 0.07,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Color.fromRGBO(30, 30, 30, 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: Dimensiones.width10),
              child: DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                dropdownColor: Color.fromRGBO(30, 30, 30, 1),
                underline: Container(
                  color: const Color.fromARGB(255, 119, 119, 119),
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
                hint: const Text("seleccione una opcion"),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      texto: "Cancelar",
                      color: Colors.black,
                      colorTexto: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(width: Dimensiones.screenWidth * 0.02),
                    Button(
                      texto: "Confirmar",
                      color: const Color.fromRGBO(91, 59, 183, 1),
                      colorTexto: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
