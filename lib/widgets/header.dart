import 'package:flutter/material.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/utils.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "Simple Drive",
            style: textStyle(
              28,
              AppColors.textTwo,
              FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: mediaQuery.size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                offset: const Offset(10, 10),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                offset: const Offset(-10, 10),
                blurRadius: 10,
              ),
            ]),
            child: Row(
              children: <Widget>[
                tabCell("Storage", mediaQuery, true),
                tabCell("Files", mediaQuery, false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tabCell(String text, MediaQueryData mediaQuery, bool isSelected) {
    return Expanded(
      child: isSelected
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.orange,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      offset: const Offset(10, 10),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      offset: const Offset(-10, 10),
                      blurRadius: 10,
                    ),
                  ]),
              child: Text(
                text,
                style: textStyle(
                  23,
                  Colors.white,
                  FontWeight.bold,
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: 60,
              child: Text(
                text,
                style: textStyle(
                  23,
                  AppColors.textTwo,
                  FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
