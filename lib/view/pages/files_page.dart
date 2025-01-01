import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/utils.dart';
import 'package:simple_drive_app/controller/files_page_controller.dart';
import 'package:simple_drive_app/widgets/folder_section.dart';
import 'package:simple_drive_app/widgets/recent_files.dart';

class FilesPage extends StatelessWidget {
  FilesPage({super.key});

  final TextEditingController folderNameController = TextEditingController();
  final FilesPageController filesPageController =
      Get.put(FilesPageController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  RecentFiles(),
                  FolderSection(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: FloatingActionButton(
              onPressed: () {
                showUploadDialog(context);
              },
              backgroundColor: AppColors.orange,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  showUploadDialog(BuildContext context) {
    return showModalBottomSheet(
        shape: OutlineInputBorder(borderRadius: BorderRadius.zero),
        context: context,
        builder: (context) {
          return FittedBox(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Get.back();
                        openAddFolderDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            EvaIcons.folderAdd,
                            size: 32,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Folder",
                            style: textStyle(18, Colors.black, FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 30),
                    InkWell(
                      onTap: () async {
                        // FirebaseService firebaseService = FirebaseService();
                        // await firebaseService.uploadFile("");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Upload",
                              style:
                                  textStyle(18, Colors.black, FontWeight.bold)),
                          const SizedBox(width: 5),
                          Icon(
                            EvaIcons.upload,
                            size: 32,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  openAddFolderDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsPadding: const EdgeInsets.only(right: 10, bottom: 10),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            title: Text(
              "New folder",
              style: textStyle(
                17,
                Colors.black,
                FontWeight.w600,
              ),
            ),
            content: TextFormField(
              controller: folderNameController,
              autofocus: true,
              style: textStyle(
                17,
                Colors.black,
                FontWeight.w600,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[250],
                hintText: "Untitled Folder",
                hintStyle: textStyle(
                  16,
                  Colors.grey,
                  FontWeight.w500,
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "Cancel",
                  style: textStyle(
                    16,
                    AppColors.textTwo,
                    FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  userCollection
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("folders")
                      .add({
                    "name": folderNameController.text.trim(),
                    "time": DateTime.now(),
                  });
                  Get.back();
                  showMessage(
                      context: context,
                      message: "Folder has been added successfully!");
                },
                child: Text(
                  "Create",
                  style: textStyle(
                    16,
                    AppColors.orange,
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
