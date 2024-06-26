import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/theme/fontweight_helper.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.spMin,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font18BlackRegular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font16BlackBold = TextStyle(
      fontSize: 16.spMin,
      fontWeight: FontWeightHelper.bold,
      color: Colors.black,
      overflow: TextOverflow.ellipsis);
  static TextStyle font16GrayRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kPrimreyColor,
  );
  static TextStyle font40BlackBold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.kPrimreyColor,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.darkBlue,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.darkBlue,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kPrimreyColor,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.spMin,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.gray,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.kPrimreyColor,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.gray,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.darkBlue,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
}
