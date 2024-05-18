import 'package:flutter/material.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.loginView);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account?',
                style: TextStyles.font13DarkBlueRegular,
              ),
              TextSpan(
                text: ' Login Now',
                style: TextStyles.font13BlueSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
