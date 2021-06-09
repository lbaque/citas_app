class ConfigMenuModel {
  String id;
  String etiqueta;
  String pagina;
  String tipo;
  String menu_lateral;
  String menu_cuadro;
  String icono;
  String dato;

  ConfigMenuModel({
    this.id,
    this.etiqueta,
    this.pagina,
    this.tipo,
    this.menu_lateral,
    this.menu_cuadro,
    this.icono,
    this.dato,
  });

  factory ConfigMenuModel.fromJson(Map<String, dynamic> json) {
    return ConfigMenuModel(
      id: json['id'],
      etiqueta: json['etiqueta'],
      pagina: json['pagina'],
      tipo: json['tipo'],
      menu_lateral: json['menu_lateral'],
      menu_cuadro: json['menu_cuadro'],
      icono: json['icono'],
      dato: json['dato'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tipo': this.tipo,
        'etiqueta': this.etiqueta,
        'pagina': this.pagina,
        'menu_lateral': this.menu_lateral,
        'menu_cuadro': this.menu_cuadro,
        'icono': this.icono,
        'dato': this.dato,
      };
}
