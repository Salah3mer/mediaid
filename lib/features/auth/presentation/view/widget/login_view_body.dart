import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/local/cash_helper.dart';
import 'package:mediaid/config/theme/text_theme.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/custom_button.dart';
import 'package:mediaid/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:mediaid/features/auth/presentation/view/widget/dont_have_account.dart';
import 'package:mediaid/features/auth/presentation/view/widget/login_textformfeilds.dart';
import 'package:mediaid/features/auth/presentation/view/widget/terms_condaition_text.dart';
import 'package:mediaid/features/auth/presentation/view/widget/welcome_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          AppConstans.token = state.authResponceBodyModel.userData!.token!;
          AppConstans.userName =
              state.authResponceBodyModel.userData!.username!;
          CashHelper.setString(
              key: AppConstans.tokenKey,
              value: state.authResponceBodyModel.userData!.token!);
          CashHelper.setString(
              key: AppConstans.userNameKey,
              value: state.authResponceBodyModel.userData!.username!);
          showTopSnackBar(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Good job, your Login is successful. Have a nice day",
            ),
          );
          context.pushReplacementNamed(Routes.homeView);
        } else if (state is LoginErrorState) {
          showTopSnackBar(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      'There is some information. You need to do something with that${state.failure.toString()}'));
        } else {
          print('loading');
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 50.h),
            child: Form(
              key: LoginCubit.get(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeWidget(),
                  verticalSpace(40),
                  const LoginTextFormFeilds(),
                  verticalSpace(20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forget Password',
                        style: TextStyles.font13BlueRegular),
                  ),
                  verticalSpace(20),
                  CustomButton(
                    buttonText: 'Login',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      if (LoginCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        LoginCubit.get(context).login();
                      }
                    },
                  ),
                  verticalSpace(60),
                  const TermsAndConditionsText(),
                  verticalSpace(20),
                  const DontHaveAccountText(),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
