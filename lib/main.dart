import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_note/controllers/view_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late List<ThemeData> _themes;
  final ViewController _viewController = Get.put(ViewController());

  void _generateThemes() {
    final themes = <ThemeData>[];
    for (final brightness in {Brightness.light, Brightness.dark}) {
      themes.add(
        ThemeData(
          brightness: brightness,
          colorSchemeSeed: const Color.fromARGB(255, 255, 0, 170),
          textTheme: GoogleFonts.geologicaTextTheme(
            const TextTheme(
              headlineLarge: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }
    _themes = themes;
  }
  
  @override
  void initState() {
    super.initState();
    _generateThemes();
  }
}