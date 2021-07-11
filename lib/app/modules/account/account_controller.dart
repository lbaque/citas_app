import 'package:citas_app/app/data/model/UserModel.dart';
import 'package:get/get.dart';
import 'package:citas_app/app/data/providers/auth.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/data/repository/users_database.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AccountController extends GetxController {
  AuthService _auth = Get.find<AuthService>();
  UserPreferences _userPreferences = Get.find<UserPreferences>();

  String _emailx = "";
  String _passwordx = "";

  void onEmailxChanged(String t) {
    _emailx = t;
  }

  void onPasswordxChanged(String t) {
    _passwordx = t;
  }

  //LOGIN
  Future<void> onLogin() async {
    await _auth.singinWithEmailAndPassword(_emailx, _passwordx).then((value) {
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

//Text field state
  String _name = "";
  String _lastname = "";
  String _dni = "";
  String _email = "";
  String _password = "";
  String _passwordConfirm = "";
  String _typeuser = "FINAL";
  String _username;

  void onNameChanged(String t) {
    _name = t;
  }

  void onLastNameChanged(String t) {
    _lastname = t;
  }

  void onDNIChanged(String t) {
    _dni = t;
  }

  void onEmailChanged(String t) {
    _email = t;
  }

  void onPasswordChanged(String t) {
    _password = t;
  }

  void onPasswordConfirmChanged(String t) {
    _passwordConfirm = t;
  }

  void onTypeUserChanged(String t) {
    _typeuser = t;
  }

  void onUserNameChanged(String t) {
    _username = t;
  }

//REGISTER
  Future<void> onRegister() async {
    _passwordConfirm = _password;
    _password = _passwordConfirm;

    var userModel = UserModel(
        name: _name,
        lastname: _lastname,
        dni: _dni,
        email: _email,
        password: _password,
        typeuser: _typeuser,
        username: _username);

    await _auth.registerWithEmailAndPassword(userModel).then((value) {
      UsersDataBase(uid: value.user.uid).find().then((x) {
        _userPreferences.signOut().then((value) {
          _auth.signOut();
          Get.offNamed(AppRoutes.LOGIN);
        });
      });
    }).catchError((e) => {
          if (e.code == 'weak-password')
            {
              messageDialog(
                  "Error", "La contraseña proporcionada es demasiado débil.")
            }
          else if (e.code == 'email-already-in-use')
            {
              messageDialog(
                  "Error", "La cuenta ya existe para ese correo electrónico.")
            }
          else if (e.code == 'wrong-password')
            {messageDialog("Alerta!", "Clave incorrecta.")}
          else if (e.code == 'user-not-found')
            {messageDialog("Alerta!", "Credenciales incorrecta.")}
        });
  }

  String _emailreset = "";
  void onEmailResetPasswordChanged(String t) {
    _emailreset = t;
  }

//LOGIN
  Future<void> onResetPassword() async {
    await _auth.sendPasswordResetEmail(_emailreset).then((value) {
      Get.offNamed(AppRoutes.LOGIN);
    });
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
}
