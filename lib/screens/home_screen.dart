import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:take_note/widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController _dataController = Get.put(DataController());
  final ViewController _viewController = Get.put(ViewController());
  int currentPageIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages.add(
      HomeWidget(
        dataController: _dataController,
        viewController: _viewController,
      ),
    );
    pages.add(Text("Notes"));
    pages.add(Text("Profile"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomAppBar(
                  userName: _dataController.appUser.value.name,
                  userPhoto: 'assets/avatar1.png',
                  viewController: _viewController,
                ),
                pages[currentPageIndex],
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Iconsax.home),
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(icon: Icon(Iconsax.note), label: 'Notes'),
            NavigationDestination(
              icon: Icon(Iconsax.profile_circle),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}