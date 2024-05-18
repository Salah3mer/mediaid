part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginChangeVisabilityState extends LoginState {}

final class LoginChangeVisabilityLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final AuthResponceBodyModel authResponceBodyModel;

  const LoginSuccessState(this.authResponceBodyModel);
}

final class LoginErrorState extends LoginState {
  final String failure;

  const LoginErrorState(this.failure);
}
