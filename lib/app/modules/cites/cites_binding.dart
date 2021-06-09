import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/modules/cites/cites_controller.dart';
import 'package:get/instance_manager.dart';

class CitesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CitesController());
    Get.lazyPut(() => UserPreferences());
  }
}
