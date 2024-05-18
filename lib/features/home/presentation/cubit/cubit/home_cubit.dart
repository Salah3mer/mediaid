import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/features/home/data/models/home_model/home_model.dart';
import 'package:mediaid/features/home/data/repository/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImple homeRepositoryImple;
  HomeCubit(this.homeRepositoryImple) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  void getHomeData() async {
    emit(HomeLoadingState());

    var responce = await homeRepositoryImple.getHome(
      token: AppConstans.token,
    );
    responce.fold(
      (failure) => emit(HomeErrorState(failure.error)),
      (responce) => emit(HomeSuccessState(responce)),
    );
  }
}
