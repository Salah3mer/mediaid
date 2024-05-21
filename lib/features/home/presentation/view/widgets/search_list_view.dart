import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/core/utils/helper/extension.dart';
import 'package:mediaid/features/home/presentation/cubit/search_cubit/search_cubit.dart';
import 'package:mediaid/features/home/presentation/view/widgets/doctor_list_item.dart';

import '../../../../../core/router/router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.doctors.length,
              itemBuilder: (context, index) =>
                  DoctorListItem(index: index, doctor: state.doctors),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ));
        } else if (state is SearchErrorState) {
          if (state.error == 'Unauthorized') {
            return Center(
                child: TextButton(
              child: const Text('You have To Loagin Agin'),
              onPressed: () => context.pushReplacementNamed(Routes.loginView),
            ));
          }else return SizedBox();
        } else if (state is SearchLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
              color: Colors.blue,
              ));}else {
          return SizedBox();
        }
      },
    );
  }
}
