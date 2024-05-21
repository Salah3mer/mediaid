import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:mediaid/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:mediaid/features/home/presentation/view/widgets/search_veiw,body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});








  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: HomeCubit.get(context)
                .currantView[HomeCubit.get(context).currantIndex],
            extendBody: true,
            //?  dont use safeArea in body widget
            //* it will show  backGround Color for the bottom nav
            bottomNavigationBar: CircleNavBar(
              activeIcons: const [
                Icon(IconBroken.Home, color: AppColors.kPrimreyColor),
                Icon(IconBroken.Search, color: AppColors.kPrimreyColor),
                Icon(IconBroken.Calendar, color: AppColors.kPrimreyColor),
                Icon(IconBroken.Profile, color: AppColors.kPrimreyColor),
              ],
              inactiveIcons: const [
                Icon(IconBroken.Home, color: AppColors.lightGray),
                Icon(IconBroken.Search, color: AppColors.lightGray),
                Icon(IconBroken.Calendar, color: AppColors.lightGray),
                Icon(IconBroken.Profile, color: AppColors.lightGray),
              ],
              color: AppColors.iconBackgroundColor,
              circleColor: AppColors.iconBackgroundColor,
              height: 60,
              circleWidth: 60,
              onTap: (index) => {

                  HomeCubit.get(context).changeIndex(index),


              },

              // tabCurve: ,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              cornerRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),

              activeIndex: HomeCubit.get(context).currantIndex,
            ),
          ),
        );
      },
    );
  }
}
