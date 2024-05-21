import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/textformfield.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';
import 'package:mediaid/features/home/presentation/view/widgets/day_piker.dart';

class DoctorInformation extends StatelessWidget {
  const DoctorInformation({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Dr.${doctor.name!}',
                  style: TextStyle(
                    fontSize: 19.spMin,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
              const Spacer(),
              Container(
                  decoration: const BoxDecoration(
                    color: AppColors.specialityBackColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doctor.specialization!.name!,
                      style: TextStyles.font13GrayRegular,
                    ),
                  )),
              horizontalSpace(5),
            ],
          ),
          verticalSpace(5),
          Row(
            children: [
              const Icon(
                IconBroken.Location,
                color: AppColors.gray,
                size: 20,
              ),
              horizontalSpace(2),
              Text(
                '${doctor.city!.name!} | ${doctor.city!.governrate!.name!}',
                style: TextStyles.font14GrayRegular,
              ),
              const Spacer(),
              Text(
                'AppointPrice:  ${doctor.appointPrice!} \$',
                style: TextStyles.font14DarkBlueMedium,
              ),
            ],
          ),
          verticalSpace(10),
          Text(
            'Email : ${doctor.email!} \nPhone : ${doctor.phone!} \nAddress : ${doctor.address!} ',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16GrayRegular,
          ),
          verticalSpace(10),
          Text(
            'Select Schedule',
            style: TextStyles.font16BlackBold,
          ),
          const DayPicker(),
          verticalSpace(10),
          CustomTextFormFeild(
            label: 'Add Note',
            maxLine: 4,
            contantPadding: 5,
          ),
        ],
      ),
    );
  }
}
