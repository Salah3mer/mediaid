import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';

ThemeData lightTheme() => ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      primaryColor: AppColors.kPrimreyColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
