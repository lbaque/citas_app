import 'package:citas_app/app/modules/information/information_controller.dart';
import 'package:get/instance_manager.dart';

class InformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InformationController());
  }
}
