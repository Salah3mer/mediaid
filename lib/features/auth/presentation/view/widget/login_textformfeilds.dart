import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/textformfield.dart';
import 'package:mediaid/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

class LoginTextFormFeilds extends StatelessWidget {
  const LoginTextFormFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormFeild(
                textInputType: TextInputType.emailAddress,
                controller: LoginCubit.get(context).emailController,
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
            verticalSpace(15),
            CustomTextFormFeild(
              textInputType: TextInputType.visiblePassword,
              controller: LoginCubit.get(context).passwordController,
              label: AutofillHints.password,
              isObScure: LoginCubit.get(context).isObscure,
              validator: (value) {
                if (value!.isNotEmpty && value.length > 8) {
                  return null;
                }
                return 'Please enter your password';
              },
              prefixIcon: IconBroken.Password,
              suffixIconbutton: IconButton(
                  onPressed: () {
                    LoginCubit.get(context).changeVisablety();
                  },
                  icon: Icon(
                    LoginCubit.get(context).isObscure
                        ? IconBroken.Show
                        : IconBroken.Hide,
                    color: Theme.of(context).iconTheme.color,
                  )),
            ),
          ],
        );
      },
    );
  }
}
