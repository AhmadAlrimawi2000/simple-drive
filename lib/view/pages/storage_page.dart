import 'package:flutter/material.dart';
import 'package:simple_drive_app/widgets/storage_container.dart';
import 'package:simple_drive_app/widgets/upload_options.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(height: 40),
        StorageContainer(),
        UploadOptions(),
      ],
    );
  }
}
