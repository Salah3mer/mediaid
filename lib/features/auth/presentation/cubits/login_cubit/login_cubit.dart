import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/features/auth/data/models/auth_Model/auth_responce_body_model.dart';
import 'package:mediaid/features/auth/data/repository/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepositoryImpl authRepositoryImpl;
  LoginCubit(this.authRepositoryImpl) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isObscure = true;
  void changeVisablety() {
    emit(LoginChangeVisabilityLoadingState());
    isObscure = !isObscure;
    emit(LoginChangeVisabilityState());
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    var resulte = await authRepositoryImpl.login(
        email: emailController.text, password: passwordController.text);
    resulte.fold(
      (failure) => emit(LoginErrorState(failure.error)),
      (responce) => emit(LoginSuccessState(responce)),
    );
  }
}
