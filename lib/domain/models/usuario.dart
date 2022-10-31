class Usuario {
  final String id;
  final String nombre;
  final String rol;
  final String usuario;

  Usuario(
      {required this.id,
      required this.nombre,
      required this.rol,
      required this.usuario});

  factory Usuario.desdeJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        nombre: json['nombre'],
        rol: json['rol'],
        usuario: json['usuario']);
  }
}
