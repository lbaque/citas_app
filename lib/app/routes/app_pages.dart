import 'package:citas_app/app/modules/authenticate/authenticate_binding.dart';
import 'package:citas_app/app/modules/authenticate/authenticate_page.dart';
import 'package:citas_app/app/modules/cites/cites_binding.dart';
import 'package:citas_app/app/modules/cites/cites_page.dart';
import 'package:citas_app/app/modules/cites/create_cites_page.dart';
import 'package:citas_app/app/modules/cites/details_cites_page.dart';
import 'package:citas_app/app/modules/cites/delete_cites_page.dart';
import 'package:citas_app/app/modules/cites/edit_cites_page.dart';
import 'package:citas_app/app/modules/entidad/entidad_binding.dart';
import 'package:citas_app/app/modules/entidad/entidad_page.dart';
import 'package:citas_app/app/modules/home/home_binding.dart';
import 'package:citas_app/app/modules/home/home_page.dart';
import 'package:citas_app/app/modules/information/information_binding.dart';
import 'package:citas_app/app/modules/information/information_page.dart';
import 'package:citas_app/app/modules/login/login_binding.dart';
import 'package:citas_app/app/modules/login/login_page.dart';
import 'package:citas_app/app/modules/parametros/create_parametros_page.dart';
import 'package:citas_app/app/modules/parametros/edit_parametros_page.dart';
import 'package:citas_app/app/modules/parametros/parametros_binding.dart';
import 'package:citas_app/app/modules/parametros/parametros_page.dart';
import 'package:citas_app/app/modules/register/register_binding.dart';
import 'package:citas_app/app/modules/register/register_page.dart';
import 'package:citas_app/app/modules/splash/splash_binding.dart';
import 'package:citas_app/app/modules/splash/splash_page.dart';
import 'package:citas_app/app/modules/users/users_binging.dart';
import 'package:citas_app/app/modules/users/users_page.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.AUTHENTICATE,
        page: () => AuthenticatePage(),
        binding: AuthenticateBinding()),
    GetPage(
        name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.INFORMATION,
        page: () => InformationPage(),
        binding: InformationBinding()),
    GetPage(name: AppRoutes.LOGINGOOGLE, page: null, binding: null),

    //PARAMETROS
    GetPage(
        name: AppRoutes.PARAMETROS,
        page: () => ParametrosPage(),
        binding: ParametrosBinding()),
    GetPage(
        name: AppRoutes.PARAMETROSCreate,
        page: () => CreateParametrosPage(),
        binding: ParametrosBinding()),
    GetPage(
        name: AppRoutes.PARAMETROSEdit,
        page: () => EditParametrosPage(),
        binding: ParametrosBinding()),

    //CITES
    GetPage(
        name: AppRoutes.CITES,
        page: () => CitesPage(),
        binding: CitesBinding()),
    GetPage(
        name: AppRoutes.CITESCreate,
        page: () => CreateCitesPage(),
        binding: CitesBinding()),
    GetPage(
        name: AppRoutes.CITESEdit,
        page: () => EditCitesPage(),
        binding: CitesBinding()),
    GetPage(
        name: AppRoutes.CITESDetails,
        page: () => DetailsCitesPage(),
        binding: CitesBinding()),
    GetPage(
        name: AppRoutes.CITESDelete,
        page: () => DeleteCitesPage(),
        binding: CitesBinding()),

    //ENTIDAD
    GetPage(
        name: AppRoutes.ENTIDAD,
        page: () => EntidadPage(),
        binding: EntidadBinding()),
    //USUARIOS
    GetPage(
        name: AppRoutes.USUARIOS,
        page: () => UsersPage(),
        binding: UsersBinding()),
  ];
}
