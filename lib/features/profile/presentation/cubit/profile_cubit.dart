import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/features/profile/data/model/profile_model/profile_model.dart';
import 'package:mediaid/features/profile/data/repository/profile_repository_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepositoryImpl profileRpositoryImpl;
  ProfileCubit(this.profileRpositoryImpl) : super(ProfileInitial());
  Future<void> getProfile() async {
    emit(GetPrfileLoadingState());

    var resulte =
        await profileRpositoryImpl.getProfile(token: AppConstans.token);

    resulte.fold((failure) => emit(GetPrfileErrorState(failure.error)),
        (user) => emit(GetPrfileSuccessState(user)));
  }
}
