import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/core/errors/api_error_model.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/auth/data/models/auth_Model/auth_responce_body_model.dart';
import 'package:mediaid/features/auth/data/repository/auth_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepositoryImpl authRepositoryImpl;

  RegisterCubit(this.authRepositoryImpl) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isObScure = true;
  void changeVisiblety() {
    emit(ChangeVisibletyLoadingState());
    isObScure = !isObScure;
    emit(ChangeVisibletySuccessState());
  }

  int gender = 0;

  void changeGroupValue({required int newValue}) {
    emit(RegisterChangeGenderLoadingState());
    gender = newValue;
    emit(RegisterChangeGenderSuccessState());
  }

  void clearTextFormField() {
    emit(RegisterClearTextFormFiledLoadingState());
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emit(RegisterClearTextFormFiledSuccessState());
  }

  ApiErrorModel? apiErrorModel;
  void register() async {
    emit(RegisterLoadingState());
    var resulte = await authRepositoryImpl.register(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        gender: gender.toString());
    resulte.fold((failure) => emit(RegisterErrorState(failure.error)),
        (responce) => emit(RegisterSuccessState(responce)));
  }
}
//? emial    'wsw@www.com'
//? password '12344321Aa#'
