class ParametrosModel {
  String id;
  String tipo;
  String codigo;
  String valor;
  String descripcion;
  String nombre;
  bool activo;

  ParametrosModel(
      {this.id,
      this.tipo,
      this.codigo,
      this.valor,
      this.descripcion,
      this.nombre,
      this.activo});

  factory ParametrosModel.fromJson(Map<String, dynamic> json) {
    return ParametrosModel(
      id: json['id'],
      tipo: json['tipo'],
      codigo: json['codigo'],
      valor: json['valor'],
      descripcion: json['descripcion'],
      nombre: json['nombre'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tipo': this.tipo,
        'codigo': this.codigo,
        'valor': this.valor,
        'descripcion': this.descripcion,
        'nombre': this.nombre,
        'activo': this.activo,
      };
}
