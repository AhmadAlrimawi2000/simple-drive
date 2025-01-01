// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:get/get.dart';
// import 'package:mime/mime.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:simple_drive_app/constants/prints.dart';
// import 'package:simple_drive_app/constants/utils.dart';
// import 'package:uuid/uuid.dart';
// import 'package:video_compress/video_compress.dart' as vc;

// class FirebaseService {
//   Uuid uuid = Uuid();
//   Future<File?> compressFile(File file, String fileType) async {
//     if (fileType == "image") {
//       Directory directory = await getTemporaryDirectory();
//       String targetPath =
//           "${directory.path}/${Uuid().v4().substring(0, 8)}.jpg";
//       XFile? result = await FlutterImageCompress.compressAndGetFile(
//         file.path,
//         targetPath,
//         quality: 75,
//       );

//       //! Convert XFile To File
//       if (result != null) {
//         return File(result.path);
//       }
//     } else if (fileType == "video") {
//       vc.MediaInfo? info = await vc.VideoCompress.compressVideo(
//         file.path,
//         quality: vc.VideoQuality.MediumQuality,
//         deleteOrigin: false,
//         includeAudio: true,
//       );

//       if (info != null && info.file != null) {
//         return File(info.file!.path);
//       }
//     }

//     return null;
//   }

//   uploadFile(String folderName) async {
//     //! Pick Files
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(allowMultiple: true);

//     if (result != null) {
//       //! Store Picked Files
//       List<File> files = result.paths.map((path) => File(path!)).toList();

//       for (File file in files) {
//         //! Store Each File Type
//         String? fileType = lookupMimeType(file.path);
//         if (fileType != null) {
//           String filteredType = fileType.split("/").first;
//           //! Store Compressed File
//           File? compressedFile = await compressFile(file, filteredType);

//           //! Store Each File Name And Extension
//           String fileName = file.path.split("/").last;
//           String fileExtension = fileName.substring(fileName.indexOf(".") + 1);
//           int length = await userCollection
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .collection("files")
//               .get()
//               .then((value) => value.docs.length);
//           if (compressedFile != null) {
//             //! Uploading File To FIrebase Storage
//             UploadTask uploadTask = FirebaseStorage.instance
//                 .ref()
//                 .child("files")
//                 .child("File $length")
//                 .putFile(compressedFile);
//             TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
//             String fileUrl = await snapshot.ref.getDownloadURL();
//             printWarning(
//                 "File Size is:${(compressedFile.readAsBytesSync().lengthInBytes / 1024).round()}");

//             //! Saving Data In Firebase Document
//             userCollection
//                 .doc(FirebaseAuth.instance.currentUser!.uid)
//                 .collection("files")
//                 .add({
//               "fileName": fileName,
//               "fileUrl": fileUrl,
//               "fileType": filteredType,
//               "fileExtension": fileExtension,
//               "folder": folderName,
//               "size": (compressedFile.readAsBytesSync().lengthInBytes / 1024)
//                   .round(),
//               "dateUploaded": DateTime.now(),
//             });
//           }
//         }
//         if (folderName == '') {
//           Get.back();
//         } else {
//           printWarning("Canceled");
//         }
//       }
//     }
//   }
// }
