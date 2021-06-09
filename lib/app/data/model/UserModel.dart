class UserModel {
  String id;
  String name;
  String lastname;
  String dni;
  String email;
  String password;
  String typeuser;
  String username;

  UserModel(
      {this.id,
      this.name,
      this.lastname,
      this.dni,
      this.email,
      this.password,
      this.typeuser,
      this.username});

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
        id: id,
        name: json['name'],
        lastname: json['lastname'],
        dni: json['dni'],
        email: json['email'],
        password: json['password'],
        typeuser: json['typeuser'],
        username: json['username']);
  }

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'lastname': this.lastname,
        'dni': this.dni,
        'email': this.email,
        'password': this.password,
        'typeuser': this.typeuser,
        'username': this.username,
      };
}
