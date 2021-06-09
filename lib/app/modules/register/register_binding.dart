import 'package:citas_app/app/data/providers/auth.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/modules/register/register_controller.dart';
import 'package:get/instance_manager.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => UserPreferences());
    Get.lazyPut(() => AuthService());
  }
}
