import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/features/home/data/models/home_model/home_model.dart';
import 'package:mediaid/features/home/presentation/view/widgets/speciality_item.dart';

class DoctorSpeciality extends StatelessWidget {
  final HomeModel homeModel;
  const DoctorSpeciality({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Doctor Speciality',
              style: TextStyles.font18BlackBold,
            ),
            TextButton(
              child: Text(
                'Show All',
                style: TextStyles.font13BlueRegular,
              ),
              onPressed: () {},
            ),
          ],
        ),
        verticalSpace(10),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SpecialityItem(
                    title: homeModel.data![index].name!,
                    index: index,
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 15.w,
                  ),
              itemCount: 4),
        ),
      ],
    );
  }
}
