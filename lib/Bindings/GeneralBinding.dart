import 'package:get/get.dart';
import 'package:qat3/Data/NetworkManager.dart';

class GeneralBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}