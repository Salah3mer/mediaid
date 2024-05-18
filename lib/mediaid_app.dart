import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediaid/config/theme/light_theme.dart';
import 'package:mediaid/core/router/app_router.dart';
import 'package:mediaid/core/router/router.dart';

class MediaidApp extends StatelessWidget {
  const MediaidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        onGenerateRoute: AppRouter.onGenratingRoute,
        title: 'mediaid',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        initialRoute: Routes.initalRoute,
      ),
    );
  }
}
