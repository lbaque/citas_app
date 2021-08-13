import 'package:citas_app/app/data/model/CitasModel.dart';
import 'package:citas_app/app/data/model/EntidadModel.dart';
import 'package:citas_app/app/data/model/UserModel.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CitesController extends GetxController {
  final CollectionReference clcitas =
      FirebaseFirestore.instance.collection('citas');

  final CollectionReference clusers =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference clentidad =
      FirebaseFirestore.instance.collection('entidad');

  UserPreferences _userPreferences = Get.find<UserPreferences>();

  List<CitasModel> _citas = [];

  List<CitasModel> get citas => _citas;

//Text field state
  String _name = "";
  String _lastname = "";
  String _dni = "";
  String _observacion = "";
  String _date = "";
  String _timetable = "";
  String _telefono = "";
  String _direccion = "";
  String _documento = "";
  String _user = "";

  void onNameChanged(String t) {
    _name = t;
  }

  void onLastNameChanged(String t) {
    _lastname = t;
  }

  void onDNIChanged(String t) {
    _dni = t;
  }

  void onObservacionChanged(String t) {
    _observacion = t;
  }

  void onDateChanged(String t) {
    _date = t;
  }

  void ontimetableChanged(String t) {
    _timetable = t;
  }

  void ontelefonoChanged(String t) {
    _telefono = t;
  }

  void ondireccionChanged(String t) {
    _direccion = t;
  }

  void ondocumentoChanged(String t) {
    _documento = t;
  }

  void onuserChanged(String t) {
    _user = t;
  }

  void onDateChangedSearch(String t) {
    String fecha = t;
    this.loaderCitas(fecha);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String fecha = DateFormat('dd/MM/yyyy').format(DateTime.now());
    this.loaderCitas(fecha);
  }

  Future<void> cancelarItem(int x) async {
    _citas[x].estado = "Cancelado";
    var data = _citas[x];
    clcitas
        .doc(data.user)
        .collection("historial")
        .doc(data.id)
        .update(data.toJson())
        .then((value) {
      this._citas = citas.toList();
      update(['citas_page']);
    });
  }

  Future<void> confirmarItem(int x) async {
    _citas[x].estado = "Confirmado";
    var data = _citas[x];
    clcitas
        .doc(data.user)
        .collection("historial")
        .doc(data.id)
        .update(data.toJson())
        .then((value) {
      this._citas = citas.toList();
      update(['citas_page']);
    });
  }

  Future<void> loaderCitas(String fecha) async {
    this._citas.clear();
    String _typeuser = _userPreferences.typeuser;

    if (_typeuser == "FINAL") {
      clcitas
          .doc(_userPreferences.uid)
          .collection("historial")
          .where("date", isEqualTo: fecha)
          .get()
          .then((value) {
        var data = value.docs
            .map((i) =>
                CitasModel.fromJson(_userPreferences.uid, i.id, i.data()))
            .toList();
        this._citas = data.toList();
        update(['citas_page']);
      });
    }
    if (_typeuser == "ADMIN") {
      final datauser = await clusers.get();
      var x =
          datauser.docs.map((i) => UserModel.fromJson(i.id, i.data())).toList();

      x.forEach((element) {
        clcitas
            .doc(element.id)
            .collection("historial")
            .where("date", isEqualTo: fecha)
            .get()
            .then((value) {
          var data = value.docs
              .map((i) => CitasModel.fromJson(element.id, i.id, i.data()))
              .toList();
          this._citas.addAll(data.toList());
          update(['citas_page']);
        });
      });
    }
  }

  Future<void> onRegister() async {
    var citasModel = CitasModel(
        name: _name,
        lastname: _lastname,
        dni: _dni,
        observacion: _observacion,
        date: _date,
        timetable: _timetable,
        telefono: _telefono,
        direccion: _direccion,
        estado: "Confirmado");

    await clcitas
        .doc(_userPreferences.uid)
        .collection("historial")
        .add(citasModel.toJson())
        .then((value) {
      //agregar paciente ??

      var entidad = EntidadModel(
          nombres: _name,
          apellidos: _lastname,
          ciudad: "SD",
          direccion: _direccion,
          email: _userPreferences.email,
          identificcion: _dni,
          provincia: "SD",
          razon_social: "SD",
          telefono: _telefono,
          tipo: "PACIENTE");

      var data = entidad.toJson();
      clentidad.doc(_userPreferences.uid).set(data).then((value) {
        messageDialog("Alerta!", "Datos Guardados.");
        Get.toNamed(AppRoutes.CITES);
      }).catchError((error) => print("Error"));
    }).catchError((error) {
      messageDialog("Alerta!", "Error!.");
    });
  }

  Future<void> onEdit() async {
    var citasModel = CitasModel(
        name: _name,
        lastname: _lastname,
        dni: _dni,
        observacion: _observacion,
        date: _date,
        timetable: _timetable,
        telefono: _telefono,
        direccion: _direccion,
        estado: "Confirmado");

    var data = citasModel.toJson();
    await clcitas
        .doc(_user)
        .collection("historial")
        .doc(_documento)
        .update(data)
        .then((value) {
      messageDialog("Alerta!", "Datos Guardados.");
    }).catchError((error) {
      messageDialog("Alerta!", "Error!.");
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
