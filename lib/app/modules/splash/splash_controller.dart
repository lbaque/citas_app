import 'package:citas_app/app/data/providers/user_references.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  UserPreferences _userpreferences = Get.find<UserPreferences>();
  @override
  void onReady() {
    _init().then((value) => cargarPreferenciaUser());
    super.onReady();
  }

  Future<void> _init() async {
    await _userpreferences.init().then((value) => {_userpreferences = value});
  }

  Future cargarPreferenciaUser() {
    if (_userpreferences.uid != '')
      return Get.offNamed(AppRoutes.HOME);
    else
      return Get.offNamed(AppRoutes.LOGIN);
  }
}
