import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/textformfield.dart';
import 'package:mediaid/core/utils/server_locator.dart';
import 'package:mediaid/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:mediaid/features/home/presentation/cubit/search_cubit/search_cubit.dart';
import 'package:mediaid/features/home/presentation/view/widgets/search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context).changeIndex(0);
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: AppColors.iconBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(
                      IconBroken.Arrow___Left_2,
                      color: Colors.white,
                    ),
                  ),
                ),
                horizontalSpace(70),
                SvgPicture.asset(
                  AppConstans.logo,
                  height: 38.h,
                  width: 38.w,
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  'Mediaid',
                  style: TextStyles.font18BlackBold,
                )
              ],
            ),
            verticalSpace(10),
            CustomTextFormFeild(
              label: 'Search',
              prefixIcon: IconBroken.Search,
              onCahange: (val) {
                BlocProvider.of<SearchCubit>(context).search(val);
              },
            ),
            verticalSpace(10),
            const SearchListView(),
          ],
        ),
      ),
    );
  }
}
