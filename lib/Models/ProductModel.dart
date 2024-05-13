import 'package:cloud_firestore/cloud_firestore.dart';
import 'BrandModel.dart';
import 'ProductAttributeModel.dart';
import 'ProductVariationModel.dart';

class ProductModel{
  String thumbnail;
  final String title;
  final String id;
  final String parentid;
  final bool isfeatured;
  final double price;
  final double salePrice;
  final String description;
  final String categoryId;
  final String productType;
  final int stock;
   List<String>? image;
   BrandModle? brand;

   List<ProductAttributeModel>? productAttributes;
   List<ProductVariationModel>? productVariation;


  ProductModel({
    required this.productType,this.productAttributes, this.brand, this.productVariation=const [],this.image,
    required this.stock,required this.categoryId,required this.description,required this.price,this.salePrice=0,required this.id,
    required this.thumbnail,required this.title,required this.isfeatured, this.parentid=''
  });

  static ProductModel empty()=>ProductModel(id: '',productType: '',categoryId: '',thumbnail: '', title: '', isfeatured:false, price: 0, brand: BrandModle.empty(), description: '', stock: 0,productVariation: []);

  Map<String,dynamic> toJson(){
    return{
      'Title':title,
      'Thumbnail':thumbnail,
      'Id':id,
      'ParentId':parentid,
      'IsFeatured':isfeatured,
      'Price':price,
      'SalePrice':salePrice,
      'Description':description,
      'CategoryId':categoryId,
      'ProductType':productType,
      'Stock':stock,
      'Image':image??[],
      'Brand':brand!.toJson(),
      'ProductAttributes':productAttributes != null? productAttributes!.map((e) => e.toJson()).toList(): [],
      'ProductVariations':productVariation !=null? productVariation!.map((e) => e.toJson()).toList():[],
    };
  }

//
//

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){

      final data=document.data()!;

      return ProductModel(
        id: document.id,
        title: data['Title'] ?? '',
        thumbnail: data['Thumbnail'] ?? '',
        parentid:data['ParentId'] ?? '',
        isfeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        stock: int.parse((data['Stock'] ?? 0).toString()),
        image: data['Image'] != null ? List<String>.from(data['Image']) : [],
        brand:  BrandModle.fromJson(data['Brand']),
        productVariation:data['ProductVariations']!=null? (data['ProductVariations'] as  List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList():[],
        productAttributes:data['ProductAttributes'] !=null ? (data[ 'ProductAttributes'] as List<dynamic> ).map((e) => ProductAttributeModel.fromJson(e)).toList():[],
      );

  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document){
      final data=document.data() as Map<String,dynamic>;
      return ProductModel(
        id: document.id,
        title: data['Title'] ?? '',
        thumbnail: data['Thumbnail'] ?? '',
        parentid:data['ParentId'] ?? '',
        isfeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        stock: int.parse((data['Stock'] ?? 0).toString()),
        image: data['Image'] != null ? List<String>.from(data['Image']) : [],
        brand:  BrandModle.fromJson(data['Brand']),
        productVariation:data['ProductVariations']!=null? (data['ProductVariations'] as  List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList():[],
        productAttributes:data['ProductAttributes'] !=null ? (data[ 'ProductAttributes'] as List<dynamic> ).map((e) => ProductAttributeModel.fromJson(e)).toList():[],
      );

  }
}

