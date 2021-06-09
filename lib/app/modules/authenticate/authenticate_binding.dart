import 'package:citas_app/app/modules/authenticate/authenticate_controller.dart';
import 'package:get/instance_manager.dart';

class AuthenticateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticateController());
  }
}
