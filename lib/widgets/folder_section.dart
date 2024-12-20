import 'package:flutter/material.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/app_images.dart';
import 'package:simple_drive_app/constants/utils.dart';

class FolderSection extends StatelessWidget {
  const FolderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
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
                "Photos",
                style: textStyle(
                  18,
                  AppColors.textTwo,
                  FontWeight.bold,
                ),
              ),
              Text(
                "10 items",
                style: textStyle(
                  14,
                  Colors.grey.shade400,
                  FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
