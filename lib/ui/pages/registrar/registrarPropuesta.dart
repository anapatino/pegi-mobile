import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../utils/Dimensiones.dart';
import '../../widgets/Button.dart';
import '../../widgets/Filter.dart';
import '../../widgets/Header.dart';

class RegistrarPropuesta extends StatefulWidget {
  const RegistrarPropuesta({super.key});

  @override
  State<RegistrarPropuesta> createState() => _RegistrarProyectoState();
}

class _RegistrarProyectoState extends State<RegistrarPropuesta> {
  @override
  Widget build(BuildContext context) {
    int activeCurrentStep = 0;
    List<Step> stepList() => [
          Step(
              state: activeCurrentStep <= 0
                  ? StepState.editing
                  : StepState.complete,
              isActive: activeCurrentStep >= 0,
              title: const Text(''),
              content: const Center(
                child: Text('General'),
              )),
          Step(
              state: activeCurrentStep <= 1
                  ? StepState.editing
                  : StepState.complete,
              isActive: activeCurrentStep >= 1,
              title: const Text(''),
              content: const Center(
                child: Text('Especificaciones'),
              )),
          Step(
              state: activeCurrentStep <= 2
                  ? StepState.editing
                  : StepState.complete,
              isActive: activeCurrentStep >= 2,
              title: const Text(''),
              content: const Center(
                child: Text('Problematica'),
              )),
          Step(
              state: activeCurrentStep <= 3
                  ? StepState.editing
                  : StepState.complete,
              isActive: activeCurrentStep >= 3,
              title: const Text(''),
              content: const Center(
                child: Text('Objetivos'),
              )),
          Step(
              state: StepState.complete,
              isActive: activeCurrentStep >= 4,
              title: const Text(''),
              content: const Center(
                child: Text('Bibliografia'),
              ))
        ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Registrar Propuesta'),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Color.fromRGBO(91, 59, 183, 1)),
                height: Dimensiones.screenHeight * 0.19,
                child: Stepper(type: StepperType.horizontal, steps: stepList()),
              ),
            ),
            InputDownload(
                texto: "Agregar documento",
                icon: Icons.add_to_photos_outlined,
                color: const Color.fromRGBO(30, 30, 30, 1),
                onPressed: () {}),
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
                      texto: "Enviar",
                      color: const Color.fromRGBO(91, 59, 183, 1),
                      colorTexto: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
