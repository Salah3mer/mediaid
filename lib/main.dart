import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/bloc_observer.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/config/local/cash_helper.dart';
import 'package:mediaid/core/utils/server_locator.dart';
import 'package:mediaid/mediaid_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  getItSetup();
  AppConstans.token = CashHelper.getString(key: AppConstans.tokenKey) ?? '';
  AppConstans.userName =
      CashHelper.getString(key: AppConstans.userNameKey) ?? 'There';
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MediaidApp());
}
