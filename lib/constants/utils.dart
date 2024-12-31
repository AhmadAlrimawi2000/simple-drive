import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_drive_app/constants/app_colors.dart';

TextStyle textStyle(double fontSize, Color color, FontWeight fontWeight) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

CollectionReference<Map<String, dynamic>> userCollection =
    FirebaseFirestore.instance.collection("users");

Widget errorImage() {
  return Container(
    height: 60,
    width: 65,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          offset: const Offset(10, 10),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          offset: const Offset(-10, 10),
          blurRadius: 10,
        ),
      ],
    ),
    child: Icon(Icons.error_outline, color: AppColors.orange),
  );
}

Widget loadingImage() {
  return Container(
    height: 60,
    width: 65,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          offset: const Offset(10, 10),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          offset: const Offset(-10, 10),
          blurRadius: 10,
        ),
      ],
    ),
    child: Icon(Icons.circle, color: AppColors.orange),
  );
}

showMessage({required BuildContext context, required String message}) {
  SnackBar snackBar = SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(
      message,
      style: textStyle(
        18,
        Colors.white,
        FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.orange,
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.zero,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
