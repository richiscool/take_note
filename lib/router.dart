import 'package:get/get.dart';
import 'package:take_note/bindings/data_binding.dart';
import 'package:take_note/bindings/view_binding.dart';
import 'package:take_note/screens/home_screen.dart';
import 'package:take_note/screens/login_screen.dart';
import 'package:take_note/screens/note_screen.dart';
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
    page: () {
      final args = Get.arguments as Map<String, dynamic>?;

      return NoteScreen(
        isEdit: args?['isEdit'] ?? false,
        toEdit: args?['toEdit'],
      );
    },
    bindings: [DataBinding(), ViewBinding()],
  ),
];