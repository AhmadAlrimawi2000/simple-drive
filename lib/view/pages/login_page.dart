import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:simple_drive_app/constants/app_colors.dart";
import "package:simple_drive_app/constants/app_images.dart";
import "package:simple_drive_app/constants/utils.dart";
import "package:simple_drive_app/controller/auth_controller.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomEnd,
              colors: [
            Colors.deepPurpleAccent,
            Colors.purpleAccent,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: mediaQuery.viewInsets.top + 53),
              child: Image.asset(
                AppImages.folderIcon,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Container(
              width: mediaQuery.size.width,
              margin: const EdgeInsets.only(
                top: 30,
                right: 30,
                bottom: 35,
                left: 30,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 5,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Simplify your",
                      style: textStyle(
                        25,
                        AppColors.textOne,
                        FontWeight.w700,
                      ),
                    ),
                    Text(
                      "filing system",
                      style: textStyle(
                        25,
                        AppColors.textOne,
                        FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "keep your files",
                      style: textStyle(
                        20,
                        AppColors.textTwo,
                        FontWeight.w600,
                      ),
                    ),
                    Text(
                      "organized more easily",
                      style: textStyle(
                        20,
                        AppColors.textTwo,
                        FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Get.find<AuthController>().login();
                      },
                      child: Container(
                        width: mediaQuery.size.width / 1.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.orange.withValues(alpha: 0.8),
                        ),
                        child: Center(
                          child: Text(
                            "Let's go",
                            style: textStyle(
                              23,
                              Colors.white,
                              FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
