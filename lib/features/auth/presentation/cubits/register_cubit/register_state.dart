part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class ChangeVisibletyLoadingState extends RegisterState {}

final class ChangeVisibletySuccessState extends RegisterState {}

final class RegisterChangeGenderLoadingState extends RegisterState {}

final class RegisterChangeGenderSuccessState extends RegisterState {}

final class RegisterClearTextFormFiledLoadingState extends RegisterState {}

final class RegisterClearTextFormFiledSuccessState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final AuthResponceBodyModel authResponceBodyModel;

  const RegisterSuccessState(this.authResponceBodyModel);
}

final class RegisterErrorState extends RegisterState {
  final String failure;
  const RegisterErrorState(this.failure);
}
