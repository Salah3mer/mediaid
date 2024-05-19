import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/widget/custom_button.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';
import 'package:mediaid/features/home/presentation/view/widgets/detailes_app_bar.dart';
import 'package:mediaid/features/home/presentation/view/widgets/doctor_information.dart';

class DetailesViewBody extends StatelessWidget {
  const DetailesViewBody({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Container(
              height: 320.h,
              width: double.maxFinite.w,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(doctor.photo!),
                  )),
            ),
            const Positioned(
              top: 30,
              left: 15,
              child: DetailsAppBar(),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.specialityBackColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doctor.degree!,
                      style: TextStyles.font13GrayRegular,
                    ),
                  )),
            ),
          ],
        ),
        DoctorInformation(doctor: doctor),
        CustomButton(
            buttonText: 'Confirm',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {})
      ]),
    );
  }
}
