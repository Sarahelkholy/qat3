import 'package:get/get.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/Controller/Products/CheckoutController.dart';
import 'package:qat3/Controller/Products/FavouritesController.dart';
import 'package:qat3/Controller/Products/VariationController.dart';
import 'package:qat3/Data/NetworkManager.dart';

class GeneralBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}