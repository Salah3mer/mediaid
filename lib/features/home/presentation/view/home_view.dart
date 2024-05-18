import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const HomeViewBody(),
        extendBody: true,
        //?  dont use safe area in body widget
        //* it will show  backGround Color for the bottom nav
        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(IconBroken.Home, color: AppColors.kPrimreyColor),
            Icon(IconBroken.Notification, color: AppColors.kPrimreyColor),
            Icon(IconBroken.Calendar, color: AppColors.kPrimreyColor),
            Icon(IconBroken.Profile, color: AppColors.kPrimreyColor),
          ],
          inactiveIcons: const [
            Icon(IconBroken.Home, color: AppColors.lightGray),
            Icon(IconBroken.Notification, color: AppColors.lightGray),
            Icon(IconBroken.Calendar, color: AppColors.lightGray),
            Icon(IconBroken.Profile, color: AppColors.lightGray),
          ],
          color: AppColors.iconBackgroundColor,
          circleColor: AppColors.iconBackgroundColor,
          height: 60,
          circleWidth: 60,
          onTap: (index) => {
            setState(() {
              currIndex = index;
            })
          },

          // tabCurve: ,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),

          activeIndex: currIndex,
        ),
      ),
    );
  }
}
