import 'package:flutter/material.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.registerView);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyles.font13DarkBlueRegular,
              ),
              TextSpan(
                text: ' Sign Up',
                style: TextStyles.font13BlueSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
