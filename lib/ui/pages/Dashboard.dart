import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/PropuestasCalificadasWidget.dart';
import 'package:pegi/ui/widgets/ProyectosCalificadosWidget.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/icons/grid.png'),
                        width: 30,
                        height: 30,
                      ),
                    ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Hola docente',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 5),
                      Text('sé productivo hoy',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            const ProgressAvatar(
                percent: 0.5,
                color: Color.fromRGBO(91, 59, 183, 1),
                label: '50%'),
            SizedBox(height: 30),
            const WidgetProyectos(
                percent: 0.3,
                color: Color.fromRGBO(33, 150, 243, 1),
                label: '30%'),
          ],
        ),
      ),
    );
  }
}
