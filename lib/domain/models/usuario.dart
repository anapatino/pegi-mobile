class Usuario {
  final String id;
  final String nombre;
  final String rol;
  final String usuario;
  final String contrasena;

  Usuario({
    required this.id,
    required this.nombre,
    required this.usuario,
    required this.contrasena,
    required this.rol,
  });

  factory Usuario.desdeJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      usuario: json['usuario'],
      contrasena: json['contrasena'],
      rol: json['rol'],
    );
  }
}

List<Usuario> listaUsuario = [
  Usuario(
      id: '111',
      nombre: 'ana',
      usuario: 'anapatino',
      contrasena: '123',
      rol: 'estudiante'),
  Usuario(
      id: '222',
      nombre: 'jeison',
      usuario: 'jeison2001',
      contrasena: '123',
      rol: 'docente'),
  Usuario(
      id: '333',
      nombre: 'santi',
      usuario: 'santiago2003',
      contrasena: '123',
      rol: 'admi'),
];
