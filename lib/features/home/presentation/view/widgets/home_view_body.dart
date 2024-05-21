import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/textformfield.dart';
import 'package:mediaid/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:mediaid/features/home/presentation/cubit/search_cubit/search_cubit.dart';
import 'package:mediaid/features/home/presentation/view/widgets/doctor_list_item.dart';
import 'package:mediaid/features/home/presentation/view/widgets/doctor_speciality_list.dart';
import 'package:mediaid/features/home/presentation/view/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState ) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppBar(),
                  verticalSpace(20),
                  CustomTextFormFeild(
                    prefixIcon: IconBroken.Search,
                    label: 'Search',
                    readOnly: true,
                    onTap: () {
                      HomeCubit.get(context).changeIndex(1);
                    },
                  ),
                  verticalSpace(10),
                  DoctorSpeciality(
                    homeModel: state.homeModel,
                  ),
                  verticalSpace(10),
                  Text(
                    'Recommendation Doctor',
                    style: TextStyles.font18BlackBold,
                  ),
                  verticalSpace(10),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.homeModel.data!.length,
                      itemBuilder: (context, index) => ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              state.homeModel.data![index].doctors!.length,
                          itemBuilder: (context, doctorIndex) => DoctorListItem(
                              index: doctorIndex,
                              doctor: state.homeModel.data![index].doctors!),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              )),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ))
                ],
              ),
            ),
          );
        } else if (state is HomeErrorState) {
          if (state.error == 'Unauthorized') {
            return Center(
                child: TextButton(
              child: const Text('You have To Loagin Agin'),
              onPressed: () => context.pushReplacementNamed(Routes.loginView),
            ));
          } else {
            return const SizedBox();
          }
        } else  {
          return Center(child: const CircularProgressIndicator(color: Colors.blue,));
        }
      },
    );
  }
}
