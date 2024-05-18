import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/icon_broken.dart';
import 'package:mediaid/core/utils/helper/spacing.dart';
import 'package:mediaid/core/utils/helper/widget/textformfield.dart';
import 'package:mediaid/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class RegisterTextFormFeilds extends StatelessWidget {
  const RegisterTextFormFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var register = RegisterCubit.get(context);
        return Form(
          key: register.formKey,
          child: Column(
            children: [
              CustomTextFormFeild(
                textInputType: TextInputType.name,
                controller: register.nameController,
                label: AutofillHints.name,
                prefixIcon: IconBroken.Profile,
              ),
              verticalSpace(10),
              CustomTextFormFeild(
                  textInputType: TextInputType.emailAddress,
                  controller: register.emailController,
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
                textInputType: TextInputType.phone,
                controller: register.phoneController,
                label: 'phone',
                prefixIcon: IconBroken.Call,
              ),
              verticalSpace(10),
              CustomTextFormFeild(
                textInputType: TextInputType.visiblePassword,
                controller: register.passwordController,
                label: AutofillHints.password,
                isObScure: register.isObScure,
                validator: (value) {
                  if (value!.isNotEmpty &&
                      (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) &&
                      value.length > 8) {
                    return null;
                  }
                  return 'Please enter your password';
                },
                prefixIcon: IconBroken.Password,
                suffixIconbutton: IconButton(
                    onPressed: () {
                      register.changeVisiblety();
                    },
                    icon: Icon(
                      register.isObScure ? IconBroken.Show : IconBroken.Hide,
                      color: Theme.of(context).iconTheme.color,
                    )),
              ),
              CustomTextFormFeild(
                textInputType: TextInputType.visiblePassword,
                controller: register.confirmPasswordController,
                label: 'confirm Password',
                isObScure: register.isObScure,
                validator: (value) {
                  if (register.passwordController.text == value) {
                    return null;
                  }
                  return ' your password not match';
                },
                prefixIcon: IconBroken.Password,
                suffixIconbutton: IconButton(
                    onPressed: () {
                      register.changeVisiblety();
                    },
                    icon: Icon(
                      register.isObScure ? IconBroken.Show : IconBroken.Hide,
                      color: Theme.of(context).iconTheme.color,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
