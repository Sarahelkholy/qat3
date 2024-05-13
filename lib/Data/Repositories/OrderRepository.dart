import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'package:qat3/Models/OrderModel.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async{
    try{
      final userId=AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Unable ti find user information, Try again in few minutes.';

      final result=await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
    }
    catch(e){
      throw 'Something went wrong while fetching order information. Try again later';
    }
  }

  Future<void> saveOrder(OrderModel order,String userId) async{
    try{
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    }
    catch(e){
      throw 'Something went wrong while fetching order information. Try again later';
    }
  }
}