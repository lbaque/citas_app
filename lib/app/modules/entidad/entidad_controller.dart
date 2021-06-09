import 'package:citas_app/app/data/model/EntidadModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class EntidadController extends GetxController {
  final CollectionReference clentidad =
      FirebaseFirestore.instance.collection('entidad');

  final arguments = Get.arguments;

  List<EntidadModel> _entidad = [];

  List<EntidadModel> get entidad => _entidad;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    this.loader(arguments['tipo']);
  }

  Future<void> loader(String tipo) async {
    final data = await clentidad.where("tipo", isEqualTo: tipo).get();
    this._entidad =
        data.docs.map((i) => EntidadModel.fromJson(i.data())).toList();
    update(['entidad_page']);
  }
}
