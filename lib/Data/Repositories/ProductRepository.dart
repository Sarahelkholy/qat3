
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Models/ProductModel.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance=>Get.find();
  final _db=FirebaseFirestore.instance;


  Future<List<ProductModel>> getFeaturedProducts() async{
    try{
      final snapshot= await _db.collection("Products").where("IsFeatured",isEqualTo: false).limit(4).get();
      final list=snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;
    }
    on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async{
    try{
      final snapshot= await _db.collection("Products").where("IsFeatured",isEqualTo: true).get();
      final list=snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;
    }
    on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try{
      final querySnapshot=await query.get();
      final List<ProductModel> productList=querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
    return productList;
    }
    on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async{
    try{
    final snapshot=await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get();
    return snapshot.docs.map((querysnapshot) => ProductModel.fromSnapshot(querysnapshot)).toList();
    }
    on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId,int limit=-1}) async{
    try{
      final querySnapshot=limit==-1
          ?await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).get()
          :await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).limit(limit).get();
      final products=querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }
    on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId,int limit=4}) async{
    try{
      QuerySnapshot productCategoryQuery=limit==-1
          ?await _db.collection('ProductCategory').where('CategoryId',isEqualTo: categoryId).get()
          :await _db.collection('ProductCategory').where('CategoryId',isEqualTo:categoryId).limit(limit).get();

      List<String> productId=productCategoryQuery.docs.map((doc) => doc['ProductId'] as String).toList();
      final productsQuery= await _db.collection("Products").where(FieldPath.documentId,whereIn: productId).get();
      List<ProductModel> products=productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }
    on FirebaseException catch(e){
      throw FirebaseException(plugin: '$e');
    }on PlatformException catch(e){
      throw PlatformException(code: '$e');
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}