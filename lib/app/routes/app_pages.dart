import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/control_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/card/bindings/card_binding.dart';
import '../modules/card/views/card_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/person/bindings/person_binding.dart';
import '../modules/person/views/person_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CONTROL;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CONTROL,
      page: () => ControllView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: _Paths.EXPLORE,
        page: () => const ExploreView(),
        binding: ExploreBinding()),
    GetPage(
        name: _Paths.CARD,
        page: () => const CardView(),
        binding: CardBinding()),
    GetPage(
        name: _Paths.PERSON,
        page: () => const PersonView(),
        binding: PersonBinding()),
  ];
}
