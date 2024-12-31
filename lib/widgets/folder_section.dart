import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/app_images.dart';
import 'package:simple_drive_app/constants/utils.dart';
import 'package:simple_drive_app/controller/files_page_controller.dart';

class FolderSection extends StatelessWidget {
  const FolderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FilesPageController>(builder: (controller) {
      if (controller.folders.isNotEmpty) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.folders.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.00001),
                      offset: Offset(10, 10),
                      blurRadius: 5,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    AppImages.folderContainerIcon,
                    height: 82,
                    width: 82,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    controller.folders[index].name ?? "",
                    style: textStyle(
                      18,
                      AppColors.textTwo,
                      FontWeight.bold,
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: userCollection
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("files")
                          .where("folder",
                              isEqualTo: controller.folders[index].name)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        return Text(
                          "${snapshot.data!.docs.length} items",
                          style: textStyle(
                            14,
                            Colors.grey.shade400,
                            FontWeight.bold,
                          ),
                        );
                      }),
                ],
              ),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: AppColors.orange,
          ),
        );
      }
    });
  }
}
