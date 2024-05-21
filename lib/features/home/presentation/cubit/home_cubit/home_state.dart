part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}
final class ChangeIndexLoadingState extends HomeState {}
final class ChangeIndexSuccessState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  const HomeSuccessState(this.homeModel);
  @override
  List<Object> get props => [homeModel];
}

final class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState(this.error);

  @override
  List<Object> get props => [error];
}
