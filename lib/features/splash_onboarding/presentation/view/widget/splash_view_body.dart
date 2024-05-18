import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: SvgPicture.asset(AppConstans.fidinglogo)),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppConstans.logo,
                height: 72.h,
                width: 72.w,
              ),
              horizontalSpace(5),
              AnimatedTextKit(
                isRepeatingAnimation: false,
                onFinished: () {
                  if (AppConstans.onBordingState ?? false) {
                    print(AppConstans.token);
                    print(AppConstans.userName);
                    if (AppConstans.token.isEmpty) {
                      context.pushReplacementNamed(Routes.loginView);
                    } else {
                      context.pushReplacementNamed(Routes.homeView);
                    }
                  } else {
                    context.pushReplacementNamed(Routes.onBoardingView);
                  }
                },
                animatedTexts: [
                  WavyAnimatedText(
                    'Mediaid',
                    textStyle: TextStyles.font40BlackBold,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
