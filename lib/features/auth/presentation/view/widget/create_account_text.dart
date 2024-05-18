import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Account',
            style: Theme.of(context).textTheme.headlineLarge),
        verticalSpace(20),
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                textStyle: TextStyles.font14GrayRegular),
          ],
        ),
      ],
    );
  }
}
