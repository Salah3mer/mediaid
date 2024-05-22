import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/features/home/data/models/home_model/home_model.dart';
import 'package:mediaid/features/home/data/repository/home_repo_impl.dart';
import 'package:mediaid/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:mediaid/features/home/presentation/view/widgets/search_veiw,body.dart';
import 'package:mediaid/features/profile/presentation/view/profile_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImple homeRepositoryImple;
  HomeCubit(this.homeRepositoryImple) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currantIndex = 0;
  void changeIndex(int index) {
    emit(ChangeIndexLoadingState());
    currantIndex = index;
    if (currantIndex == 0) {
      getHomeData();
    }
    emit(ChangeIndexSuccessState());
  }

  List<Widget> currantView = [
    const HomeViewBody(),
    const SearchViewBody(),
    const ProfileView(),
  ];

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
