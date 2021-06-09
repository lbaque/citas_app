import 'package:citas_app/app/data/model/ConfigMenuModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class menu {
  final CollectionReference clmenu =
      FirebaseFirestore.instance.collection('config_menu');

  Future<void> consultarMenu() async {
    final data = await clmenu.get();

    var config_menu =
        data.docs.map((i) => ConfigMenuModel.fromJson(i.data())).toList();
  }
}
