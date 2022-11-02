import 'package:flutter/material.dart';

class MostrarTodo extends StatefulWidget {
  final String texto;
  final bool? estado;
  final String? tipo;
  final Color colorBoton;
  final VoidCallback onPressed;
  const MostrarTodo({
    super.key,
    required this.texto,
    this.tipo,
    this.estado = false,
    required this.colorBoton,
    required this.onPressed,
  });

  @override
  State<MostrarTodo> createState() => _MostrarTodoState();
}

class _MostrarTodoState extends State<MostrarTodo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
          height: 110,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Color.fromRGBO(30, 30, 30, 1)),
          child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20),
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 9.0),
                      child: Text(
                        widget.texto,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                        child: widget.estado == false
                            ? Container()
                            : Container(
                                width: 85.0,
                                height: 20.0,
                                padding: const EdgeInsets.only(top: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(80),
                                      bottomRight: Radius.circular(80),
                                      topLeft: Radius.circular(80),
                                      topRight: Radius.circular(80)),
                                  color: widget.colorBoton,
                                ),
                                child: Text(
                                  widget.tipo.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color:
                                          Color.fromARGB(255, 221, 221, 221)),
                                ),
                              )),
                  ],
                ),
                const SizedBox(width: 110),
                Align(
                  alignment: Alignment.topCenter,
                  child: IconButton(
                      onPressed: () {
                        widget.onPressed();
                      },
                      icon: const Icon(Icons.edit_outlined,
                          size: 37, color: Color.fromRGBO(91, 59, 183, 1))),
                )
              ]))),
    );
  }
}
