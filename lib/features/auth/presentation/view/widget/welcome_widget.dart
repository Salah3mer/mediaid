import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back!', style: Theme.of(context).textTheme.headlineLarge),
        verticalSpace(20),
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                textStyle: TextStyles.font14GrayRegular),
          ],
        ),
      ],
    );
  }
}
