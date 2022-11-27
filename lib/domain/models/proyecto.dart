// ignore_for_file: public_member_api_docs, sort_constructors_first
class Proyecto {
  var titulo;
  var idEstudiante;
  var anexos;
  var estado;
  var calificacion;
  var idProyecto;
  var idDocente;
  var retroalimentacion;
  Proyecto(
      {required this.titulo,
      required this.idEstudiante,
      required this.anexos,
      required this.estado,
      required this.calificacion,
      required this.idProyecto,
      required this.idDocente,
      required this.retroalimentacion});

  factory Proyecto.desdeDoc(Map<String, dynamic> data) {
    return Proyecto(
      titulo: data['titulo'] ?? '',
      idEstudiante: data['idEstudiante'] ?? '',
      anexos: data['anexos'] ?? '',
      estado: data['estado'] ?? '',
      calificacion: data['calificacion'] ?? '',
      idDocente: data['idDocente'] ?? '',
      idProyecto: data['idProyecto'] ?? '',
      retroalimentacion: data['retroalimentacion'] ?? '',
    );
  }
}
