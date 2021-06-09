import 'package:citas_app/app/data/providers/auth.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/data/repository/users_database.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AuthService _auth = Get.find<AuthService>();
  UserPreferences _userPreferences = Get.find<UserPreferences>();

  String _email = "";
  String _password = "";

  void onEmailChanged(String t) {
    _email = t;
  }

  void onPasswordChanged(String t) {
    _password = t;
  }

  //LOGIN
  Future<void> onLogin() async {
    await _auth.singinWithEmailAndPassword(_email, _password).then((value) {
      UsersDataBase(uid: value.user.uid).find().then((x) {
        _userPreferences.uid = x.id;
        _userPreferences.entry = true;
        _userPreferences.email = x.email;
        _userPreferences.typeuser = x.typeuser;
        _userPreferences.username = x.username;
        _userPreferences.commit();

        Get.offNamed(AppRoutes.HOME);
      });
    }).catchError((e) {
      if (e.code == 'weak-password') {
        messageDialog(
            "Error", "La contraseña proporcionada es demasiado débil.");
      } else if (e.code == 'email-already-in-use') {
        messageDialog(
            "Error", "La cuenta ya existe para ese correo electrónico.");
      } else if (e.code == 'wrong-password') {
        messageDialog("Alerta!", "Clave incorrecta.");
      } else if (e.code == 'user-not-found') {
        messageDialog("Alerta!", "Credenciales incorrecta.");
      }
    });
  }
}

void messageDialog(String title, String message) {
  Get.dialog(AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("OK"))
    ],
  ));
}
