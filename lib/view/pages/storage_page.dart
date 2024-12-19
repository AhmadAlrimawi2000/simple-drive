import 'package:flutter/material.dart';
import 'package:simple_drive_app/widgets/storage_container.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 40),
        StorageContainer(),
      ],
    );
  }
}