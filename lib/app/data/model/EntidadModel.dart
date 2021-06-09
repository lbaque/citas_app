class EntidadModel {
  String id;
  String tipo;
  String razon_social;
  String identificcion;
  String tipo_identificcion;
  String email;
  String nombres;
  String apellidos;
  String telefono;
  String direccion;
  String ciudad;
  String provincia;
  String usuario_id;
  DateTime fecha_creado;
  DateTime fecha_editado;
  bool activo;

  EntidadModel(
      {this.id,
      this.tipo,
      this.razon_social,
      this.identificcion,
      this.tipo_identificcion,
      this.email,
      this.nombres,
      this.apellidos,
      this.telefono,
      this.direccion,
      this.ciudad,
      this.provincia,
      this.usuario_id,
      this.fecha_creado,
      this.fecha_editado,
      this.activo});

  factory EntidadModel.fromJson(Map<String, dynamic> json) {
    return EntidadModel(
      id: json['id'],
      tipo: json['tipo'],
      razon_social: json['razon_social'],
      identificcion: json['identificcion'],
      tipo_identificcion: json['tipo_identificcion'],
      email: json['email'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      telefono: json['telefono'],
      direccion: json['direccion'],
      ciudad: json['ciudad'],
      provincia: json['provincia'],
      usuario_id: json['usuario_id'],
      fecha_creado: json['fecha_creado'],
      fecha_editado: json['fecha_editado'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tipo': this.tipo,
        'razon_social': this.razon_social,
        'identificcion': this.identificcion,
        'tipo_identificcion': this.tipo_identificcion,
        'email': this.email,
        'nombres': this.nombres,
        'apellidos': this.apellidos,
        'telefono': this.telefono,
        'direccion': this.direccion,
        'ciudad': this.ciudad,
        'provincia': this.provincia,
        'usuario_id': this.usuario_id,
        'fecha_creado': this.fecha_creado,
        'fecha_editado': this.fecha_editado,
        'activo': this.activo,
      };
}
