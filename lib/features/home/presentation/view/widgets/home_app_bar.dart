import 'package:flutter/material.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${AppConstans.userName}!',
              style: TextStyles.font18BlackBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font13GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.iconBackgroundColor,
          child: IconButton(
            icon: const Icon(
              IconBroken.Notification,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
