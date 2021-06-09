import 'package:citas_app/app/data/providers/auth.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AuthService _auth = Get.find<AuthService>();
  UserPreferences _userPreferences = Get.find<UserPreferences>();

  List<Widget> _listalateral = [];
  List<Widget> get listalateral => _listalateral;

  String _typeuser;
  String get typeuser => _typeuser;

  @override
  void onInit() {
    super.onInit();

    this.loaderMenuLateral();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> loaderMenuLateral() async {
    _typeuser = _userPreferences.typeuser;

    _listalateral.clear();
    _listalateral.add(DrawerHeader(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.fill,
          )),
      child: Text('iDentalAC'),
    ));
    _listalateral.add(ListTile(
      leading: new Icon(Icons.home),
      title: new Text("Principal"),
    ));

    _listalateral.add(ListTile(
      leading: new Icon(Icons.calendar_today),
      title: new Text("Registrar Cita"),
      onTap: () => Get.toNamed(AppRoutes.CITESCreate),
    ));
    _listalateral.add(ListTile(
      leading: new Icon(Icons.search),
      title: new Text("Consultar Cita"),
      onTap: () => Get.toNamed(AppRoutes.CITES),
    ));

    if (_typeuser != "FINAL") {
      _listalateral.add(ListTile(
        leading: new Icon(Icons.person_add_rounded),
        title: new Text("Pacientes"),
        onTap: () =>
            Get.toNamed(AppRoutes.ENTIDAD, arguments: {'tipo': 'PACIENTE'}),
      ));
      _listalateral.add(ListTile(
          leading: new Icon(Icons.person_add),
          title: new Text("Usuarios"),
          onTap: () => Get.toNamed(AppRoutes.USUARIOS)));
    }
  }

  Future<void> signOut() async {
    await _userPreferences.signOut().then((value) {
      _auth.signOut();
    });

    Get.offNamed(AppRoutes.LOGIN);
  }
}
