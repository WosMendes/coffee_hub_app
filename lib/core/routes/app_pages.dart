import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_binding.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_page.dart';
import 'package:coffee_hub_app/ui/splash_screen/splash_screen_binding.dart';
import 'package:coffee_hub_app/ui/splash_screen/splash_screen_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreenPage(),
      binding: HomeScreenBinding(),
    ),
  ];
}