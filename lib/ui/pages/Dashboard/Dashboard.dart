import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/Navbar.dart';
import 'package:pegi/ui/widgets/ProgressAvatar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Navbar("Docente", Icons.space_dashboard),
            ProgressAvatar(
              porcentaje: 0.5,
              color: const Color.fromRGBO(91, 59, 183, 1),
              label: '50%',
              texto: 'Propuestas \ncalificadas',
              seguimiento: '8/16 revisiones',
            ),
            const SizedBox(height: 30),
            ProgressAvatar(
              porcentaje: 0.3,
              color: const Color.fromRGBO(33, 150, 243, 1),
              label: '30%',
              texto: 'Proyectos \ncalificadas',
              seguimiento: '8/16 revisiones',
            ),
          ],
        ),
      ),
    );
  }
}