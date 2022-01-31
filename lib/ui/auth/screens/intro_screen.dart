import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:gangapp_flutter/ui/theme/gangapp_icons.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await authController.signInGoogle();
        },
      ),
      body: Center(
        child: Icon(GangappIcons.search_product),
      ),
    );
  }
}
