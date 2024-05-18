import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/local/cash_helper.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/custom_button.dart';
import 'package:mediaid/features/splash_onboarding/presentation/view/widget/onboarding_appbar.dart';
import 'package:mediaid/features/splash_onboarding/presentation/view/widget/onboarding_stack_image_text.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
        child: Column(
          children: [
            const OnBoardingAppBar(),
            verticalSpace(30),
            const OnBoardingStackImageText(),
            Text(
              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
              textAlign: TextAlign.center,
              style: TextStyles.font13GrayRegular,
            ),
            verticalSpace(20),
            CustomButton(
              buttonText: 'Get Started',
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                CashHelper.setBoolean(
                    key: AppConstans.onBoardingKey, value: true);
                context.pushReplacementNamed(Routes.loginView);
              },
            )
          ],
        ),
      ),
    ));
  }
}
