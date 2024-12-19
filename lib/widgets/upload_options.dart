import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simple_drive_app/constants/app_colors.dart';

class UploadOptions extends StatelessWidget {
  const UploadOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        optionContainer(
          AppColors.optionOne,
          AppColors.iconOne,
          Icons.image,
          32,
          "image",
          "Images",
        ),
        optionContainer(
          AppColors.optionTwo,
          AppColors.iconTwo,
          Icons.play_arrow_rounded,
          38,
          "video",
          "Videos",
        ),
        optionContainer(
          AppColors.optionThree,
          AppColors.iconThree,
          EvaIcons.fileText,
          30,
          "application",
          "Documents",
        ),
        optionContainer(
          AppColors.optionFour,
          AppColors.iconFour,
          EvaIcons.music,
          32,
          "image",
          "images",
        ),
      ],
    );
  }

  Widget optionContainer(Color color, Color iconColor, IconData icon,
      double iconSize, String option, String title) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
