import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/data/services/peticionesIndex.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../../data/services/peticionesPropuesta.dart';
import '../../../domain/Controllers/controladorIndex.dart';
import '../../../domain/Controllers/controladorUsuario.dart';
import '../../utils/Dimensiones.dart';
import '../../widgets/Button.dart';
import '../../widgets/Header.dart';

class RegistrarPropuesta extends StatefulWidget {
  const RegistrarPropuesta({super.key});

  @override
  State<RegistrarPropuesta> createState() => _RegistrarPropuestaState();
}

class _RegistrarPropuestaState extends State<RegistrarPropuesta> {
  ControlUsuario controlu = Get.find();
  ControlPropuesta controlp = Get.find();
  ControlIndex controlI = Get.find();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlIdentificacion = TextEditingController();
  TextEditingController controlNumero = TextEditingController();
  TextEditingController controlPrograma = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlCelular = TextEditingController();
  TextEditingController controlNombre2 = TextEditingController();
  TextEditingController controlApellido2 = TextEditingController();
  TextEditingController controlIdentificacion2 = TextEditingController();
  TextEditingController controlNumero2 = TextEditingController();
  TextEditingController controlPrograma2 = TextEditingController();
  TextEditingController controlCorreo2 = TextEditingController();
  TextEditingController controlCelular2 = TextEditingController();
  TextEditingController controlLineaInvestigacion = TextEditingController();
  TextEditingController controlSublineaInvestigacion = TextEditingController();
  TextEditingController controlAreaTematica = TextEditingController();
  TextEditingController controlGrupoInvestigacion = TextEditingController();
  TextEditingController controlPlanteamiento = TextEditingController();
  TextEditingController controlJustificacion = TextEditingController();
  TextEditingController controlBibliografia = TextEditingController();

  TextEditingController controlGeneral = TextEditingController();
  TextEditingController controlEspecifico = TextEditingController();
  TextEditingController controlAnexo = TextEditingController();

  PlatformFile? file;
  static late final FilePickerResult? pickedFile;
  static late final Uint8List? pickedFileBytes;
  static late final String pickedFileName;

  Future selectFile() async {
    if (kIsWeb) {
      pickedFile = await FilePicker.platform.pickFiles();
      if (pickedFile != null) {
        pickedFileBytes = pickedFile!.files.first.bytes;
        pickedFileName = pickedFile!.files.first.name;
      }
      print('Archivo selecionado: $pickedFileName');
    } else {
      final fileSelect = await FilePicker.platform.pickFiles();

      if (fileSelect == null) return;
      setState(() {
        file = fileSelect.files.first;
      });
      print('Archivo selecionado: ${file!.name}');
    }
  }

  int _activeCurrentStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> stepList() => [
          Step(
              state: _activeCurrentStep <= 0
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 0,
              title: const Text(''),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Primer Integrante',
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 221, 221, 221))),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNombre,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlApellido,
                      "Appelido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlIdentificacion,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNumero,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlPrograma,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCorreo,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCelular,
                      "Celular",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Text('Segundo Integrante',
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 221, 221, 221))),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNombre2,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlApellido2,
                      "Appelido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlIdentificacion2,
                      "Identificacion",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlNumero2,
                      "N°",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlPrograma2,
                      "Programa",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCorreo2,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  SizedBox(height: Dimensiones.screenHeight * 0.022),
                  Input(
                      false,
                      controlCelular2,
                      "Celular",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 8),
                      const Color.fromRGBO(30, 30, 30, 1),
                      const Color.fromARGB(255, 221, 221, 221)),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensiones.height2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(),
                          SizedBox(width: Dimensiones.screenWidth * 0.02),
                          Button(
                            texto: "Siguiente",
                            color: const Color.fromRGBO(91, 59, 183, 1),
                            colorTexto: Colors.white,
                            onPressed: () {
                              setState(() => _activeCurrentStep += 1);
                            },
                          ),
                        ],
                      )),
                ],
              )),
          Step(
              state: _activeCurrentStep <= 1
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 1,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Input(
                        false,
                        controlLineaInvestigacion,
                        "Linea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlSublineaInvestigacion,
                        "Sublinea de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlAreaTematica,
                        "Area tematica",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    Input(
                        false,
                        controlGrupoInvestigacion,
                        "Grupo de investigacion",
                        const EdgeInsets.all(0),
                        const EdgeInsets.only(bottom: 8),
                        const Color.fromRGBO(30, 30, 30, 1),
                        const Color.fromARGB(255, 221, 221, 221)),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                              texto: "Atras",
                              color: Color.fromARGB(255, 66, 66, 66),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep -= 1);
                              },
                            ),
                            SizedBox(width: Dimensiones.screenWidth * 0.02),
                            Button(
                              texto: "Siguiente",
                              color: const Color.fromRGBO(91, 59, 183, 1),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep += 1);
                              },
                            ),
                          ],
                        )),
                  ])),
          Step(
              state: _activeCurrentStep <= 2
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 2,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputMedium(
                      controlPlanteamiento,
                      "Planteamiento",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputMedium(
                      controlJustificacion,
                      "Justificacion",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                              texto: "Atras",
                              color: Color.fromARGB(255, 66, 66, 66),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep -= 1);
                              },
                            ),
                            SizedBox(width: Dimensiones.screenWidth * 0.02),
                            Button(
                              texto: "Siguiente",
                              color: const Color.fromRGBO(91, 59, 183, 1),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep += 1);
                              },
                            ),
                          ],
                        )),
                  ])),
          Step(
              state: _activeCurrentStep <= 3
                  ? StepState.editing
                  : StepState.complete,
              isActive: _activeCurrentStep >= 3,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputMedium(
                      controlGeneral,
                      "General",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    InputMedium(
                      controlEspecifico,
                      "Especificos",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                              texto: "Atras",
                              color: Color.fromARGB(255, 66, 66, 66),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep -= 1);
                              },
                            ),
                            SizedBox(width: Dimensiones.screenWidth * 0.02),
                            Button(
                              texto: "Siguiente",
                              color: const Color.fromRGBO(91, 59, 183, 1),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep += 1);
                              },
                            ),
                          ],
                        )),
                  ])),
          Step(
              state: StepState.editing,
              isActive: _activeCurrentStep >= 4,
              title: const Text(''),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputMedium(
                      controlBibliografia,
                      "Bibliografias",
                      EdgeInsets.symmetric(
                          vertical: Dimensiones.screenHeight * 0.02),
                      Colors.white,
                      const Color.fromRGBO(30, 30, 30, 1),
                    ),
                    SizedBox(height: Dimensiones.screenHeight * 0.022),
                    if (file == null)
                      InputDownload(
                          controlador: controlAnexo,
                          texto: "Añadir anexo",
                          icon: Icons.add_to_photos_outlined,
                          color: const Color.fromRGBO(30, 30, 30, 1),
                          onPressed: () {
                            selectFile();
                          }),
                    if (file != null)
                      InputDownload(
                          controlador: controlAnexo,
                          texto: file!.name,
                          icon: Icons.add_to_photos_outlined,
                          color: const Color.fromRGBO(30, 30, 30, 1),
                          onPressed: () {
                            selectFile();
                          }),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensiones.height2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Button(
                              texto: "Atras",
                              color: Color.fromARGB(255, 66, 66, 66),
                              colorTexto: Colors.white,
                              onPressed: () {
                                setState(() => _activeCurrentStep -= 1);
                              },
                            ),
                            SizedBox(width: Dimensiones.screenWidth * 0.02),
                            Button(
                              texto: "Enviar",
                              color: const Color.fromRGBO(91, 59, 183, 1),
                              colorTexto: Colors.white,
                              onPressed: () async {
                                String index = await controlI.consultarIndex();

                                var Propuesta = <String, dynamic>{
                                  'idEstudiante': controlu.emailf,
                                  'idPropuesta': index,
                                  'nombre': controlNombre.text,
                                  'apellido': controlApellido.text,
                                  'identificacion': controlIdentificacion.text,
                                  'numero': controlNumero.text,
                                  'programa': controlPrograma.text,
                                  'correo': controlCorreo.text,
                                  'celular': controlCelular.text,
                                  'nombre2': controlNombre2.text,
                                  'apellido2': controlApellido2.text,
                                  'identificacion2':
                                      controlIdentificacion2.text,
                                  'numero2': controlNumero2.text,
                                  'programa2': controlPrograma2.text,
                                  'correo2': controlCorreo2.text,
                                  'celular2': controlCelular2.text,
                                  'lineaInvestigacion':
                                      controlLineaInvestigacion.text,
                                  'sublineaInvestigacion':
                                      controlSublineaInvestigacion.text,
                                  'areaTematica': controlAreaTematica.text,
                                  'grupoInvestigacion':
                                      controlGrupoInvestigacion.text,
                                  'planteamiento': controlPlanteamiento.text,
                                  'justificacion': controlJustificacion.text,
                                  'general': controlGeneral.text,
                                  'especificos': controlEspecifico.text,
                                  'bibliografia': controlBibliografia.text,
                                  'anexos': controlAnexo.text,
                                  'estado': "pendiente",
                                  'retroalimentacion': '',
                                  'calificacion': '',
                                  'idDocente': ''
                                };
                                controlp
                                    .registrarPropuesta(Propuesta, file,
                                        pickedFileBytes, pickedFileName)
                                    .then((value) => {
                                          Get.showSnackbar(const GetSnackBar(
                                            title: 'Regristrar Propuesta',
                                            message:
                                                'Datos registrados Correctamente',
                                            icon: Icon(Icons.gpp_good_outlined),
                                            duration: Duration(seconds: 5),
                                            backgroundColor: Colors.greenAccent,
                                          ))
                                        })
                                    .catchError((e) {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Regristrar Propuesta',
                                    message: 'Error al registrar propuesta',
                                    icon: Icon(Icons.warning),
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.red,
                                  ));
                                });
                              },
                            ),
                          ],
                        )),
                  ])),
        ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Registrar Propuesta'),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: Dimensiones.screenHeight * 0.95,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensiones.screenWidth * 0.04),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('General',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Especificaciones',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Problematica',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Objetivos',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                          Text('Bibliografia',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                      255, 221, 221, 221))),
                        ]),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                          scrollbarTheme: ScrollbarThemeData(
                            interactive: true,
                            crossAxisMargin: Dimensiones.screenWidth * 0.02,
                            mainAxisMargin: Dimensiones.screenWidth * 0.05,
                            radius: const Radius.circular(14),
                            thumbColor:
                                MaterialStateProperty.all((Colors.grey[500])),
                          ),
                          canvasColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Stepper(
                        physics: const ScrollPhysics(),
                        margin: EdgeInsets.zero,
                        type: StepperType.horizontal,
                        currentStep: _activeCurrentStep,
                        steps: stepList(),
                        onStepTapped: (int index) {
                          setState(() => _activeCurrentStep = index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
