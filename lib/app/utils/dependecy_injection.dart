import 'package:citas_app/app/data/providers/auth.dart';
import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => UserPreferences());
    Get.lazyPut(() => AuthService());
  }
}
