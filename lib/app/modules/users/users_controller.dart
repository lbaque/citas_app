import 'package:citas_app/app/data/model/UserModel.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final CollectionReference clusers =
      FirebaseFirestore.instance.collection('users');
  UserPreferences _userPreferences = Get.find<UserPreferences>();

  List<UserModel> _users = [];
  List<UserModel> _memory = [];
  List<UserModel> get users => _users;
  @override
  void onInit() {
    this.loader();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void filtroBusqueda(String t) {
    List<UserModel> _temp = [];
    if (t.isNotEmpty) {
      this._memory.forEach((element) {
        if (element.name.toLowerCase().contains(t)) {
          _temp.add(element);
        } else if (element.lastname.toLowerCase().contains(t)) {
          _temp.add(element);
        } else if (element.dni.toLowerCase().contains(t)) {
          _temp.add(element);
        } else if (element.username.toLowerCase().contains(t)) {
          _temp.add(element);
        } else if (element.email.toLowerCase().contains(t)) {
          _temp.add(element);
        }
      });
      this._users = _temp;
    } else {
      this._users = this._memory;
    }
    update(['users_page']);
  }

  Future<void> loader() async {
    final datauser = await clusers.get();
    this._users =
        datauser.docs.map((i) => UserModel.fromJson(i.id, i.data())).toList();
    this._memory = this._users;
    update(['users_page']);
  }
}
