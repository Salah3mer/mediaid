import 'package:flutter/material.dart';
import 'package:mediaid/features/splash_onboarding/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SplashViewBody(),
      ),
    );
  }
}
