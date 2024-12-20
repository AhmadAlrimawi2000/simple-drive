import 'package:flutter/material.dart';
import 'package:simple_drive_app/widgets/folder_section.dart';
import 'package:simple_drive_app/widgets/recent_files.dart';

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
    );
  }
}
