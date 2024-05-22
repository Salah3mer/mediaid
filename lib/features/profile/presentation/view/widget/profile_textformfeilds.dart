import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/textformfield.dart';
import 'package:mediaid/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileTextFormFeilds extends StatelessWidget {
  const ProfileTextFormFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is GetPrfileSuccessState) {
        return Column(children: [
          CustomTextFormFeild(
            readOnly: true,
            textInputType: TextInputType.name,
            controller: TextEditingController(text: state.user.data![0].name!),
            label: AutofillHints.name,
            prefixIcon: IconBroken.Profile,
          ),
          verticalSpace(10),
          CustomTextFormFeild(
              readOnly: true,
              textInputType: TextInputType.emailAddress,
              controller:
                  TextEditingController(text: state.user.data![0].email!),
              label: AutofillHints.email,
              prefixIcon: IconBroken.Message,
              validator: (value) {
                if (RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value!)) {
                  return null;
                }
                return 'Please Chack your email';
              }),
          verticalSpace(10),
          CustomTextFormFeild(
            readOnly: true,
            textInputType: TextInputType.phone,
            controller: TextEditingController(text: state.user.data![0].phone!),
            label: 'phone',
            prefixIcon: IconBroken.Call,
          ),
          verticalSpace(10),
        ]);
      } else {
        return const SizedBox();
      }
    });
  }
}
