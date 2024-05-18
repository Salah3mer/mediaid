import 'package:mediaid/config/local/cash_helper.dart';

class AppConstans {
  static const logo = 'assets/image/mediaid_logo.svg';
  static const fidinglogo = 'assets/image/back_fiding_logo.svg';
  static const onBoardingDocImage = 'assets/image/onboarding_doc_image.png';
  static const onBoardingKey = 'onBoarding';
  static bool? onBordingState = CashHelper.getBoolean(key: onBoardingKey);
  static const tokenKey = 'token';
  static String token = '';
  static const userNameKey = 'userName';
  static String userName = '';

  static List<String> specialityImageUrl = [
    'https://cdn-icons-png.flaticon.com/128/5550/5550309.png',
    'https://cdn-icons-png.flaticon.com/128/3695/3695995.png',
    'https://cdn-icons-png.flaticon.com/128/4702/4702202.png',
    'https://cdn-icons-png.flaticon.com/128/10154/10154414.png',
    'https://cdn-icons-png.flaticon.com/128/8519/8519747.png'
  ];
}
