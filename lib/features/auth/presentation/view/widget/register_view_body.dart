import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/custom_button.dart';
import 'package:mediaid/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:mediaid/features/auth/presentation/view/widget/already_have_account.dart';
import 'package:mediaid/features/auth/presentation/view/widget/create_account_text.dart';
import 'package:mediaid/features/auth/presentation/view/widget/register_textformfeilds.dart';
import 'package:mediaid/features/auth/presentation/view/widget/select_gendar.dart';
import 'package:mediaid/features/auth/presentation/view/widget/terms_condaition_text.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Good job, your SignUp is successful. Have a nice day",
            ),
          );
          BlocProvider.of<RegisterCubit>(context).clearTextFormField();
        } else if (state is RegisterErrorState) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
                message:
                    'There is some information. You need to do something with that${state.failure.toString()}   '),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              children: [
                const CreateAccountText(),
                verticalSpace(30),
                const RegisterTextFormFeilds(),
                verticalSpace(5),
                const UserGender(),
                verticalSpace(10),
                CustomButton(
                  buttonText: 'Sign Up ',
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    if (RegisterCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      RegisterCubit.get(context).register();
                    }
                  },
                ),
                verticalSpace(10),
                const TermsAndConditionsText(),
                verticalSpace(15),
                const AlreadyHaveAccountText()
              ],
            ),
          ),
        ));
      },
    );
  }
}
