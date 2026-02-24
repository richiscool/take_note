import 'package:get/get.dart';
import 'package:take_note/controllers/view_controller.dart';

class ViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewController>(() => ViewController());
  }
}