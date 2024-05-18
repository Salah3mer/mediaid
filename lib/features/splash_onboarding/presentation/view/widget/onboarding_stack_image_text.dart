import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/theme/text_theme.dart';

class OnBoardingStackImageText extends StatelessWidget {
  const OnBoardingStackImageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppConstans.fidinglogo),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.00),
            ],
            stops: const [.1, .36],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          child: Image.asset(AppConstans.onBoardingDocImage),
        ),
        Positioned(
          bottom: 20.h,
          right: 5.w,
          left: 5.w,
          child: Column(
            children: [
              Text('Best Doctor Appointment App',
                  textAlign: TextAlign.center,
                  style: TextStyles.font32BlueBold.copyWith(height: 1.2)),
            ],
          ),
        ),

        // SizedBox(
      ],
    );
  }
}
