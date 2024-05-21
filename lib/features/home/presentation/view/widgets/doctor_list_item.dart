import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/time_refactor.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';

class DoctorListItem extends StatelessWidget {
  final int index;
  final List<Doctor> doctor;
  const DoctorListItem({
    super.key,
    required this.index,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.doctorDetailesView, arguments: doctor[index]);
      },
      child: Container(
        height: 133.h,
        decoration: BoxDecoration(
            color: AppColors.textFormFieldFillLightColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 140.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: Colors.amber,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(doctor[index].photo! ??
                          'https://cdn-icons-png.flaticon.com/128/5550/5550309.png'))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
              // padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. ${doctor[index].name}',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    ' ${doctor[index].degree}  | ${doctor[index].city!.name} ',
                    style: TextStyles.font13GrayRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                IconBroken.Time_Circle,
                                size: 16,
                              ),
                              Text(
                                  ' ${refactorTime(doctor[index].startTime!)}  - ${refactorTime(doctor[index].endTime!)}   '),
                            ],
                          ),
                          Text(
                              ' Appoint Price  : ${doctor[index].appointPrice}  \$ '),
                        ],
                      ),
                      horizontalSpace(5),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          color: AppColors.iconBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          IconBroken.Arrow___Right_2,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
