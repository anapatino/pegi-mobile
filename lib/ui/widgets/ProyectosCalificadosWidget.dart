import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WidgetProyectos extends StatefulWidget {
  final String label;
  final double percent; //
  final Color color;
  const WidgetProyectos(
      {super.key,
      required this.label,
      required this.percent,
      required this.color});

  @override
  State<WidgetProyectos> createState() => _WidgetProyectosState();
}

class _WidgetProyectosState extends State<WidgetProyectos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Color.fromRGBO(30, 30, 30, 1)),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 10.0,
                  animation: true,
                  percent: widget.percent,
                  center: Text(
                    widget.label,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: widget.color,
                  backgroundColor: const Color.fromRGBO(65, 65, 68, 1),
                ),
                const SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Proyectos \ncalificadas',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 20),
                    Text('8/16 revisiones',
                        style: TextStyle(color: Colors.white, fontSize: 14))
                  ],
                )
              ]))),
    );
  }
}
