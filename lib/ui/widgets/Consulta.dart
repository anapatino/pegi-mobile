import 'package:flutter/material.dart';

class Consultar extends StatefulWidget {
  final String texto;
  final Color colorBoton;
  final VoidCallback onPressed;

  const Consultar({
    super.key,
    required this.texto,
    required this.colorBoton,
    required this.onPressed,
  });

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: widget.colorBoton,
                  onPressed: () {
                    widget.onPressed();
                  },
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder, size: 40, color: Colors.white),
                        SizedBox(width: 80),
                        Text(widget.texto,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
