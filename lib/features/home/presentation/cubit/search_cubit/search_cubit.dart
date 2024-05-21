import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';
import 'package:mediaid/features/home/data/repository/home_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepositoryImple homeRepositoryImple;
  SearchCubit(this.homeRepositoryImple) : super(SearchInitial());

  void search(String name) async {
    emit(SearchLoadingState());

    var result =
        await homeRepositoryImple.search(token: AppConstans.token, name: name);

    result.fold((failure) => emit(SearchErrorState(failure.error)),
        (doctors) => emit(SearchSuccessState(doctors)));
  }
}
