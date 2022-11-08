import 'package:flutter/material.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Calendar.dart';
import 'package:pegi/ui/widgets/Navbar.dart';
import 'package:pegi/ui/widgets/ProgressAvatar.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          children: <Widget>[
            Navbar("Administrador", Icons.space_dashboard),
            const Calendar(),
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
