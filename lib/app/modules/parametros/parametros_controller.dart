import 'package:citas_app/app/data/model/ParametrosModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ParametrosController extends GetxController {
  final CollectionReference clparametros =
      FirebaseFirestore.instance.collection('parametros');

  final arguments = Get.arguments;

  List<ParametrosModel> _parametros = [];

  List<ParametrosModel> get parametros => _parametros;

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
    final data = await clparametros.where("tipo", isEqualTo: tipo).get();
    this._parametros =
        data.docs.map((i) => ParametrosModel.fromJson(i.data())).toList();
    update(['parametros_page']);
  }
}
