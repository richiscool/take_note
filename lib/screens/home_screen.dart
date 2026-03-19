import 'package:flutter/material.dart';
import 'package:take_note/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:take_note/controllers/data_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController _dataController = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomAppBar(
                userName: 'Richy',
                userPhoto: 'assets/avatar2.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

}