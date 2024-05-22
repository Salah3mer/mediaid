part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class GetPrfileLoadingState extends ProfileState {}

final class GetPrfileSuccessState extends ProfileState {
  final ProfileModel user;

  const GetPrfileSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

final class GetPrfileErrorState extends ProfileState {
  final String error;

  const GetPrfileErrorState(this.error);
}
