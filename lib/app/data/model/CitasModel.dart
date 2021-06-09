class CitasModel {
  String id;
  String name;
  String lastname;
  String dni;
  String observacion;
  String date;
  String timetable;
  String telefono;
  String direccion;
  String estado;
  String user;

  CitasModel(
      {this.id,
      this.name,
      this.lastname,
      this.dni,
      this.observacion,
      this.date,
      this.timetable,
      this.telefono,
      this.direccion,
      this.estado,
      this.user});

  factory CitasModel.fromJson(
      String user, String id, Map<String, dynamic> json) {
    return CitasModel(
        id: id,
        name: json['name'],
        lastname: json['lastname'],
        dni: json['dni'],
        observacion: json['observacion'],
        date: json['date'],
        timetable: json['timetable'],
        telefono: json['telefono'],
        direccion: json['direccion'],
        estado: json['estado'],
        user: user);
  }

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'lastname': this.lastname,
        'dni': this.dni,
        'observacion': this.observacion,
        'date': this.date,
        'timetable': this.timetable,
        'telefono': this.telefono,
        'direccion': this.direccion,
        'estado': this.estado
      };
}
