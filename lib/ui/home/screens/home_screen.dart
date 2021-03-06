import 'package:flutter/material.dart';
import 'package:gangapp_flutter/global_widgets/animations/overlay_animation.dart';
import 'package:gangapp_flutter/global_widgets/navigation/custom_navigation_bar.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:gangapp_flutter/ui/chat/screens/rooms_chat_screen.dart';
import 'package:gangapp_flutter/ui/home/controllers/nav_controller.dart';
import 'package:gangapp_flutter/ui/home/screens/product_home_screen.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controller.dart';
import 'package:gangapp_flutter/ui/profile/screens/principal_profile.dart';
import 'package:gangapp_flutter/ui/profile/screens/profile_screen.dart';
import 'package:gangapp_flutter/ui/proof/controllers/product_proof_controller.dart';
import 'package:gangapp_flutter/ui/proof/screens/page1.dart';
import 'package:gangapp_flutter/ui/proof/screens/page2.dart';
import 'package:gangapp_flutter/ui/proof/screens/page3.dart';
import 'package:gangapp_flutter/ui/proof/screens/page4.dart';
import 'package:gangapp_flutter/ui/video/screens/videos_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.find();
    ProductController productController = Get.find();
    ProductProofController productProofController = Get.find();

    var screens = [
      VideosScreen(),
      RoomsChatScreen(),
      ProductHomeScreen(),
      // ProfileScreen(),
      PrincipalProfile()
    ];

    AuthController authController = AuthController();

    // AuthController authController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: (navController.index.value != 2)
            ? AppBar(
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.of(context).push(OverlayAnimation());
                  },
                ),
              )
            : null,
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: navController.index.value,
          onIndexChanged: (i) {
            navController.index.value = i;
            if (i != 2) {
              productController.productsCategoryList.value.clear();
            }
            if (i != 1) {
              productProofController.searchQueryController.clear();
            }
          },
        ),
        body: screens[navController.index.value],
      ),
    );
  }
}
