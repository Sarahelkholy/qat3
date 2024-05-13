import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel{
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId,required this.categoryId});

  Map<String,dynamic> toJson(){
    return{
      'ProductId':productId,
      'CategoryId':categoryId,
    };
  }

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    final data=snapshot.data() as Map<String,dynamic>;
    return ProductCategoryModel(
      productId: data['ProductId'] as String,
      categoryId: data['CategoryId'] as String,
    );
  }
}