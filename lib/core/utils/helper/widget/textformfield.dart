import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/theme/text_theme.dart';

class CustomTextFormFeild extends StatelessWidget {
  Function()? onTap;
  Function()? onComplet;
  Function(String val)? onCahange;
  Function(String? val)? onSave;
  Function(String val)? onSubmit;
  String? Function(String? val)? validator;
  TextInputType? textInputType;
  TextEditingController? controller;
  String label;
  bool readOnly;
  bool? isObScure;
  Widget? suffixIconbutton;
  IconData? prefixIcon;
  int? maxLine;
  double? contantPadding;
  CustomTextFormFeild({
    super.key,
    this.textInputType,
    this.maxLine,
    this.isObScure,
    this.suffixIconbutton,
    this.prefixIcon,
    this.onTap,
    this.onCahange,
    this.onComplet,
    this.controller,
    this.onSave,
    this.onSubmit,
    this.validator,
    this.readOnly = false,
    required this.label,
    this.contantPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: TextFormField(
          maxLines: maxLine ?? 1,
          controller: controller,
          onTap: onTap,
          onChanged: onCahange,
          onEditingComplete: onComplet,
          onFieldSubmitted: onSubmit,
          onSaved: onSave,
          validator: validator,
          keyboardType: textInputType,
          obscureText: isObScure ?? false,
          readOnly: readOnly,
          style: TextStyles.font18BlackRegular,
          decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: AppColors.kPrimreyColor,
              ),
              label: Text(
                label,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: contantPadding ?? 20.w,
                  vertical: contantPadding ?? 0),
              counterStyle: TextStyles.font13DarkBlueMedium,
              floatingLabelStyle: TextStyles.font13BlueRegular,
              suffixIcon: suffixIconbutton,
              fillColor: AppColors.textFormFieldFillLightColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.kPrimreyColor,
                  )),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16))),
        ),
      ),
    );
  }
}
