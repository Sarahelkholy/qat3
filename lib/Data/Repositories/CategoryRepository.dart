import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qat3/FirebaseStorageService.dart';
import 'package:qat3/Models/CtegoryModel.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  //get all categories
  Future<List<CategoryModel>> getAllCategories() async{
    try{
     final snapshot= await _db.collection("Categories").get();
     final list=snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
     return list;
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  
  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{
      final snapshot=await _db.collection("Categories").where('ParentId',isEqualTo: categoryId).get();
      final result=snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  //upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try{
      final storage=Get.put(FirebaseStorageService());
      for(var category in categories){
        final file =await storage.getImageDataFromAssets(category.image);
        final url=await storage.uploadImageData('Categories', file, category.name);
        category.image=url;
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}