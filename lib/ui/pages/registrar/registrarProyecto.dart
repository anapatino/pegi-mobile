import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/pages/registrar/registrar.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../../domain/Controllers/controlProyecto.dart';
import '../../../domain/Controllers/controladorIndex.dart';
import '../../../domain/Controllers/controladorUsuario.dart';
import '../../utils/Dimensiones.dart';
import '../../widgets/Button.dart';
import '../../widgets/Filter.dart';
import '../../widgets/Header.dart';

class RegistrarProyecto extends StatefulWidget {
  const RegistrarProyecto({super.key});

  @override
  State<RegistrarProyecto> createState() => _RegistrarProyectoState();
}

class _RegistrarProyectoState extends State<RegistrarProyecto> {
  TextEditingController controlAnexo = TextEditingController();
  TextEditingController controlTitulo = TextEditingController();

  ControlProyecto controlp = Get.find();
  ControlUsuario controlu = Get.find();
  ControlIndex controlI = Get.find();

  String? pickedFilePath;
  String? pickedFileextencion;
  static String pickedFileName = "";
  Future selectFile() async {
    final fileSelect = await FilePicker.platform.pickFiles();
    if (fileSelect == null) return;
    pickedFilePath = fileSelect.files.first.path;
    pickedFileextencion = fileSelect.files.first.extension;
    pickedFileName = fileSelect.files.first.name;
    log('Archivo selecionado: $pickedFileName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Registrar Proyecto'),
            const SizedBox(height: 5),
            Input(
                false,
                controlTitulo,
                "Titulo del proyecto",
                EdgeInsets.only(
                  left: Dimensiones.screenWidth * 0.04,
                  right: Dimensiones.screenWidth * 0.04,
                  top: Dimensiones.buttonHeight * 0.40,
                  bottom: Dimensiones.buttonHeight * 0.03,
                ),
                const EdgeInsets.only(bottom: 8),
                const Color.fromRGBO(30, 30, 30, 1),
                const Color.fromARGB(255, 221, 221, 221)),
            if (pickedFileName == "")
              InputDownload(
                  texto: "Agregar documento",
                  icon: Icons.add_to_photos_outlined,
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    selectFile();
                  }),
            if (pickedFileName != "")
              InputDownload(
                  texto: pickedFileName,
                  icon: Icons.add_to_photos_outlined,
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    selectFile();
                  }),
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
                      onPressed: () async {},
                    ),
                    SizedBox(width: Dimensiones.screenWidth * 0.1),
                    Button(
                      texto: "Enviar",
                      color: const Color.fromRGBO(91, 59, 183, 1),
                      colorTexto: Colors.white,
                      onPressed: () async {
                        String index = await controlI.consultarIndex();
                        var Proyecto = <String, dynamic>{
                          'idProyecto': index,
                          'titulo': controlTitulo.text,
                          'anexos': "",
                          'idEstudiante': controlu.emailf,
                          'estado': "pendiente",
                          'retroalimentacion': '',
                          'calificacion': '',
                          'idDocente': '',
                        };
                        controlp
                            .registrarProyecto(
                                Proyecto, pickedFilePath, pickedFileextencion)
                            .then((value) => {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Regristrar Proyecto',
                                    message: 'Datos registrados Correctamente',
                                    icon: Icon(Icons.gpp_good_outlined),
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.greenAccent,
                                  )),
                                })
                            .catchError((e) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Regristrar Proyecto',
                            message: 'Error al registrar proyecto',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        });
                      },
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
