import 'package:flutter/material.dart';
import 'package:simple_drive_app/constants/app_colors.dart';
import 'package:simple_drive_app/constants/utils.dart';

class StorageContainer extends StatelessWidget {
  const StorageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.001),
            offset: const Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.001),
            offset: const Offset(-10, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 35),
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "19",
                        style: textStyle(
                          50,
                          AppColors.textThree,
                          FontWeight.bold,
                        ),
                      ),
                      Text(
                        "%",
                        style: textStyle(
                          17,
                          AppColors.textThree,
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Used",
                    style: textStyle(
                      20,
                      AppColors.textTwo.withValues(alpha: 0.7),
                      FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.orange,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: <Widget>[
                        Text(
                          "Used",
                          style: textStyle(
                            18,
                            AppColors.textTwo.withValues(alpha: 0.7),
                            FontWeight.w600,
                          ),
                        ),
                        Text(
                          "50 GB",
                          style: textStyle(
                            20,
                            AppColors.textThree,
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withValues(alpha: 0.3),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: <Widget>[
                        Text(
                          "Free",
                          style: textStyle(
                            18,
                            AppColors.textTwo.withValues(alpha: 0.7),
                            FontWeight.w600,
                          ),
                        ),
                        Text(
                          "10 GB",
                          style: textStyle(
                            20,
                            AppColors.textThree,
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
