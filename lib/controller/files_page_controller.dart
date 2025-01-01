import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:simple_drive_app/constants/utils.dart';
import 'package:simple_drive_app/model/folder_model.dart';

class FilesPageController extends GetxController {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  RxList<FolderModel> folders = <FolderModel>[].obs;

  @override
  void onInit() {
    folders.bindStream(
      userCollection
          .doc(userId)
          .collection("folders")
          .orderBy("time", descending: true)
          .snapshots()
          .map((QuerySnapshot query) {
        List<FolderModel> folders = [];
        for (var element in query.docs) {
          FolderModel folder = FolderModel.fromDocumentSnapshot(element);
          folders.add(folder);
        }
        return folders;
      }),
    );
    super.onInit();
  }
}
