import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_drive_app/controller/auth_controller.dart';
import 'package:simple_drive_app/view/pages/login_page.dart';
import 'package:simple_drive_app/view/pages/nav_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.user.value == null ? LoginPage() : NavPage();
      },
    );
  }
}
