import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qat3/Models/BrandModel.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance=>Get.find();
  final _db=FirebaseFirestore.instance;

  Future<List<BrandModle>> getAllBrands() async{
    try  {
      final snapshot = await _db.collection('Brands').get();
      final result=snapshot.docs.map((e) => BrandModle.fromSnapshot(e)).toList();
      return result;
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on FormatException catch(e){
      throw FormatException('$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}