import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: AppColors.iconBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(
              IconBroken.Arrow___Left_2,
              color: Colors.white,
            ),
          ),
        ),
        horizontalSpace(80),
        Text(
          'Appointment',
          style: TextStyles.font18BlackBold,
        ),
      ],
    );
  }
}
