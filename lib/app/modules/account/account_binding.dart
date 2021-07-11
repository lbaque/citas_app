import 'package:citas_app/app/data/providers/auth.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/modules/account/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => UserPreferences());
    Get.lazyPut(() => AuthService());
  }
}
