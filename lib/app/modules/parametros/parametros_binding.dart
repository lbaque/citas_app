import 'package:citas_app/app/modules/parametros/parametros_controller.dart';
import 'package:get/instance_manager.dart';

class ParametrosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ParametrosController());
  }
}
