import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/utils.dart';
import 'package:simple_drive_app/controller/navigation_controller.dart';

class Header extends StatelessWidget {
  Header({super.key});

  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "Simple Drive",
            style: textStyle(
              28,
              AppColors.textTwo,
              FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: mediaQuery.size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                offset: const Offset(10, 10),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                offset: const Offset(-10, 10),
                blurRadius: 10,
              ),
            ]),
            child: Obx(() {
              return Row(
                children: <Widget>[
                  tabCell(
                    "Storage",
                    mediaQuery,
                    controller.tab.value == "storage" ? true : false,
                    () => controller.chnageTab("storage"),
                  ),
                  tabCell(
                    "Files",
                    mediaQuery,
                    controller.tab.value == "files" ? true : false,
                    () => controller.chnageTab("files"),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  Widget tabCell(String text, MediaQueryData mediaQuery, bool isSelected,
      void Function()? onTap) {
    return Expanded(
      child: isSelected
          ? InkWell(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.bounceInOut,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        offset: const Offset(-10, 10),
                        blurRadius: 10,
                      ),
                    ]),
                child: Text(
                  text,
                  style: textStyle(
                    23,
                    Colors.white,
                    FontWeight.bold,
                  ),
                ),
              ),
            )
          : InkWell(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.bounceInOut,
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  text,
                  style: textStyle(
                    23,
                    AppColors.textTwo,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }
}
