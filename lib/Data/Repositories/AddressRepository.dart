import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';

import '../../Models/AddressModel.dart';

class AddressRepository extends GetxController{
  static AddressRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async{
    try{
      final userId=AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Unable to find user information.try again in few minutes';

      final result=await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    }
    catch(e){
      throw 'Something went wrong while fetching Address information. Try again later';
    }
  }
  
  Future<void> updateSelectedField(String addressId,bool selected) async{
    try{
      final userId=AuthenticationRepository.instance.authUser!.uid;
      await  _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress':selected});
    }
    catch(e){
      throw 'Unable to update your address selection. Try again later';
    }
  }

  Future<String> addAddress(AddressModel address) async{
    try{
      final userId=AuthenticationRepository.instance.authUser!.uid;
      final currentAddress= await  _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    }
    catch(e){
      throw 'Something went wrong while saving address information. Try again later';
    }
  }
}