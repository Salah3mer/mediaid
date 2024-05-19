import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaid/core/router/router.dart';
import 'package:mediaid/core/utils/server_locator.dart';
import 'package:mediaid/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:mediaid/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:mediaid/features/auth/presentation/view/login_view.dart';
import 'package:mediaid/features/auth/presentation/view/register_view.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';
import 'package:mediaid/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:mediaid/features/home/presentation/view/doctor_detailes_view.dart';
import 'package:mediaid/features/home/presentation/view/home_view.dart';
import 'package:mediaid/features/splash_onboarding/presentation/view/onboarding_view.dart';
import 'package:mediaid/features/splash_onboarding/presentation/view/splash_view.dart';

class AppRouter extends Routes {
  static Route? onGenratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initalRoute:
        return MaterialPageRoute(builder: ((context) => const SplashView()));
      case Routes.onBoardingView:
        return MaterialPageRoute(
            builder: ((context) => const OnBoardingView()));
      case Routes.loginView:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => LoginCubit(getIt()),
                  child: const LoginView(),
                )));
      case Routes.registerView:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RegisterCubit(getIt()),
                  child: const RegisterView(),
                ));
      case Routes.homeView:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => HomeCubit(getIt())..getHomeData(),
                  child: const HomeView(),
                ));
      case Routes.doctorDetailesView:
        final doctor = settings.arguments as Doctor;

        return MaterialPageRoute(
          builder: (context) => DoctorDetailsView(doctor: doctor),
        );

      default:
        return onRouteError();
    }
  }

  static Route<dynamic> onRouteError() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            )));
  }
}
