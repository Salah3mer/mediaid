import 'package:flutter/material.dart';
import 'package:mediaid/features/splash_onboarding/presentation/view/widget/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
