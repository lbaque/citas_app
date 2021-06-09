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

  List<UserModel> get users => _users;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    this.loader();
  }

  Future<void> loader() async {
    this._users.clear();

    final datauser = await clusers.get();
    var x =
        datauser.docs.map((i) => UserModel.fromJson(i.id, i.data())).toList();
    this._users = x;
    update(['users_page']);
  }
}
