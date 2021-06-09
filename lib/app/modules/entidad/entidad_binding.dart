import 'package:citas_app/app/modules/entidad/entidad_controller.dart';
import 'package:get/instance_manager.dart';

class EntidadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EntidadController());
  }
}
