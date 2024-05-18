import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class UserGender extends StatelessWidget {
  const UserGender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: RadioListTile(
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => AppColors.kPrimreyColor,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  value: 0,
                  groupValue: RegisterCubit.get(context).gender,
                  onChanged: (value) {
                    RegisterCubit.get(context)
                        .changeGroupValue(newValue: value!);
                  },
                  title: Text(
                    'Male',
                    style: TextStyles.font14DarkBlueMedium,
                  ),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => AppColors.kPrimreyColor,
                  ),
                  value: 1,
                  contentPadding: const EdgeInsets.all(0),
                  groupValue: RegisterCubit.get(context).gender,
                  title: Text(
                    'Female',
                    style: TextStyles.font14DarkBlueMedium,
                  ),
                  onChanged: (value) {
                    RegisterCubit.get(context)
                        .changeGroupValue(newValue: value!);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
