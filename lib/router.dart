import 'package:get/get.dart';
import 'package:take_note/screens/home_screen.dart';
import 'package:take_note/screens/onboarding.dart';
import 'package:take_note/screens/login_screen.dart';

final List<GetPage> appScreens = [
  GetPage(name: '/onboarding', page: () => OnboardingScreen()),
  GetPage(name: '/auth', page: () => LoginScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
];