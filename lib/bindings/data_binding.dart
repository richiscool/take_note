import 'package:get/get.dart';
import 'package:take_note/controllers/data_controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(() => DataController());
  }
}
