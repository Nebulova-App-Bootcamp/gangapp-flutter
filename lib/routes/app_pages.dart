import 'package:gangapp_flutter/ui/home/bindings/nav_binding.dart';
import 'package:gangapp_flutter/ui/home/screens/home_screen.dart';
import 'package:gangapp_flutter/ui/auth/screens/intro_screen.dart';
import 'package:gangapp_flutter/ui/auth/screens/loading_screen.dart';
import 'package:gangapp_flutter/ui/products/bindings/product_edit_binding.dart';
import 'package:gangapp_flutter/ui/products/bindings/produt_binding.dart';
import 'package:gangapp_flutter/ui/products/screens/product_form.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL_LOGGED = Routes.HOME;
  static const INITIAL_NOT_LOGGED = Routes.INTRO;

  static final routes = [
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      bindings: [
        NavBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: Routes.PRODUCTFORM,
      page: () => ProductForm(),
      binding: ProductEditBinding(),
    ),
  ];
}
