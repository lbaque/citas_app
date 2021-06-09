import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/modules/users/users_controller.dart';
import 'package:get/instance_manager.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => UserPreferences());
  }
}
