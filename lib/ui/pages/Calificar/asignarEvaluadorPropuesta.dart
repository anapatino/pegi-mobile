import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Button.dart';

import '../../utils/Dimensiones.dart';
import '../../widgets/Mostrar.dart';

const List<String> list = <String>['Alex vacca', 'Amilkar', 'Roberto'];

class AsignarEvaluadorPropuesta extends StatefulWidget {
  final Propuesta propuesta;
  const AsignarEvaluadorPropuesta({super.key, required this.propuesta});

  @override
  State<AsignarEvaluadorPropuesta> createState() =>
      _AsignarEvaluadorPropuestaState();
}

class _AsignarEvaluadorPropuestaState extends State<AsignarEvaluadorPropuesta> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.screenHeight * 0.06,
            horizontal: Dimensiones.screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Asignar Evaluador'),
            MostrarTodo(
                texto: widget.propuesta.titulo.toString(),
                tipo: widget.propuesta.estado.toString(),
                estado: true,
                colorBoton: widget.propuesta.estado.toString().toLowerCase() ==
                        'pendiente'
                    ? const Color.fromRGBO(91, 59, 183, 1)
                    : const Color.fromRGBO(18, 180, 122, 1),
                color: Colors.black,
                fijarIcon: false,
                padding: EdgeInsets.only(
                    left: Dimensiones.screenWidth * 0.05,
                    right: Dimensiones.screenWidth * 0.05,
                    top: Dimensiones.screenHeight * 0.03),
                onPressed: () {}),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.08),
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
            Padding(
              padding: EdgeInsets.only(left: Dimensiones.screenWidth * 0.03),
              child: Container(
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
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensiones.screenHeight * 0.03,
                    horizontal: Dimensiones.screenWidth * 0.12),
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
