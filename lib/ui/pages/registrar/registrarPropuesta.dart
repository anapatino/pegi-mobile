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
  State<RegistrarPropuesta> createState() => _RegistrarPropuestaState();
}

class _RegistrarPropuestaState extends State<RegistrarPropuesta> {
  List<Step> stepList() => [
        const Step(
            title: Text('Account'),
            content: Center(
              child: Text('Account'),
            )),
        const Step(
            title: Text('Address'),
            content: Center(
              child: Text('Address'),
            )),
        const Step(
            title: Text('Confirm'),
            content: Center(
              child: Text('Confirm'),
            ))
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Registrar Propuesta'),
            const SizedBox(height: 5),
            Expanded(
                child: Stepper(
              type: StepperType.horizontal,
              steps: stepList(),
            ))
          ],
        ),
      ),
    );
  }
}
