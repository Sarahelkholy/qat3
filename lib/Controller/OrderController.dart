
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/AddressController.dart';
import 'package:qat3/Controller/CartController.dart';
import 'package:qat3/Controller/Products/CheckoutController.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Data/Repositories/OrderRepository.dart';
import 'package:qat3/Enums.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Models/OrderModel.dart';
import 'package:qat3/Screens/SuccessPayment.dart';

class OrderController extends GetxController{
  final cartController=CartController.instance;
  final addressController=AddressController.instance;
  final checkoutController=CheckoutController.instance;
  final orderRepository=Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrder()async{
    try{
      final userOrders=await orderRepository.fetchUserOrders();
      return userOrders;
    }
    catch(e){
      Loaders.warningSnackBar(title: 'Whooops!',message: e.toString());
      return[];
    }
  }

  void processOrder(double totalAmount) async{
    try{
      final userId=AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) return;

      final order=OrderModel(
          id: UniqueKey().toString(),
          Userid: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList(),
      );
      await orderRepository.saveOrder(order, userId);
      cartController.clearCart();
      Get.off(()=> SuccessPayment());
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Whooops!',message: e.toString());
    }
  }
}