import 'package:citas_app/app/data/model/EntidadModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class EntidadController extends GetxController {
  final CollectionReference clentidad =
      FirebaseFirestore.instance.collection('entidad');

  final arguments = Get.arguments;

  List<EntidadModel> _entidad = [];
  List<EntidadModel> _memory = [];
  List<EntidadModel> get entidad => _entidad;

  @override
  void onInit() {
    this.loader(arguments['tipo']);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void filtroBusqueda(String t) {
    List<EntidadModel> _temp = [];
    if (t.isNotEmpty) {
      this._memory.forEach((element) {
        if (element.nombres.toLowerCase().contains(t)) {
          _temp.add(element);
        } else if (element.apellidos.toLowerCase().contains(t)) {
          _temp.add(element);
        } else if (element.identificcion.toLowerCase().contains(t)) {
          _temp.add(element);
        }
      });
      this._entidad = _temp;
    } else {
      this._entidad = this._memory;
    }
    update(['entidad_page']);
  }

  Future<void> loader(String tipo) async {
    final data = await clentidad.where("tipo", isEqualTo: tipo).get();
    this._entidad =
        data.docs.map((i) => EntidadModel.fromJson(i.data())).toList();
    this._memory = this._entidad;
    update(['entidad_page']);
  }
}
