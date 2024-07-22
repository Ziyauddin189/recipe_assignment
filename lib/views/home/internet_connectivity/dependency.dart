import 'package:get/get.dart';
import 'package:nosh_assignment/views/home/internet_connectivity/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
