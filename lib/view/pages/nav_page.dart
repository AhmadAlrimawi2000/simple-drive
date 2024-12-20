import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_drive_app/controller/navigation_controller.dart';
import 'package:simple_drive_app/view/pages/files_page.dart';
import 'package:simple_drive_app/view/pages/storage_page.dart';
import 'package:simple_drive_app/widgets/header.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Column(
          children: <Widget>[
            Header(),
            Obx(
              () => Get.find<NavigationController>().tab.value == "storage"
                  ? StoragePage()
                  : FilesPage(),
            )
          ],
        ));
  }
}
