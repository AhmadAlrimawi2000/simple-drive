import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/utils.dart';
import 'package:simple_drive_app/widgets/folder_section.dart';
import 'package:simple_drive_app/widgets/recent_files.dart';

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
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
                      onTap: () {},
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
                      onTap: () {},
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
}
