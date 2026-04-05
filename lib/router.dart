import 'package:get/get.dart';
import 'package:take_note/bindings/data_binding.dart';
import 'package:take_note/bindings/view_binding.dart';
import 'package:take_note/screens/home_screen.dart';
import 'package:take_note/screens/login_screen.dart';
import 'package:take_note/screens/notes_screen.dart';
import 'package:take_note/screens/onboarding.dart';

final List<GetPage> appScreens = [
  GetPage(name: '/onboarding', page: () => OnboardingScreen()),
  GetPage(name: '/auth', page: () => LoginScreen(), bindings: [DataBinding()]),
  GetPage(
    name: '/home',
    page: () => HomeScreen(),
    bindings: [DataBinding(), ViewBinding()],
  ),
  GetPage(
    name: '/notes',
    page: () => NoteScreen(),
    bindings: [DataBinding(), ViewBinding()],
  ),
];