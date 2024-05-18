import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediaid/config/constants.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppConstans.logo,
          height: 38.h,
          width: 38.w,
        ),
        SizedBox(
          width: 5.h,
        ),
        Text(
          'Mediaid',
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }
}
