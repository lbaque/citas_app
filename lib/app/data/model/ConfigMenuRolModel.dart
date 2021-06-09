class ConfigMenuRolModel {
  String id;
  String menu_id;
  String rol_id;

  ConfigMenuRolModel({
    this.id,
    this.menu_id,
    this.rol_id,
  });

  factory ConfigMenuRolModel.fromJson(Map<String, dynamic> json) {
    return ConfigMenuRolModel(
      id: json['id'],
      menu_id: json['menu_id'],
      rol_id: json['rol_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'menu_id': this.menu_id,
        'rol_id': this.rol_id,
      };
}
