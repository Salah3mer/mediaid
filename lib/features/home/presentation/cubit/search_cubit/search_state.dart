part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchErrorState extends SearchState {
  final String error;

  const SearchErrorState(this.error);
}

final class SearchSuccessState extends SearchState {
  final List<Doctor> doctors;

  const SearchSuccessState(this.doctors);

  @override
  List<Object> get props => [doctors];
}
