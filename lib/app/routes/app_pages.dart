import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pokemon_details/bindings/pokemon_details_binding.dart';
import '../modules/pokemon_details/views/pokemon_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.POKEMON_DETAILS,
      page: () => const PokemonDetailsView(),
      binding: PokemonDetailsBinding(),
    ),
  ];
}
