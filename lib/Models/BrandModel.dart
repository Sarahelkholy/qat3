import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModle{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModle({required this.image,required this.id,required this.name, this.isFeatured,this.productCount});

  static BrandModle empty()=>BrandModle(image: '',id: '',name: '');


   toJson(){
    return{
      'Name':name,
      'Image':image,
      'Id':id,
      'Isfeatured':isFeatured,
      'ProductCount':productCount,
    };
  }

  factory BrandModle.fromJson (Map<String,dynamic>document){
      final data=document;
      if(data.isEmpty) return BrandModle.empty();
      return BrandModle(
        id: data['Id'],
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured:data['Isfeatured'] ?? '',
        productCount: data['ProductCount'] ?? 0,
      );
    }

    factory BrandModle.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
     if(document.data()!=null){
       final data=document.data()!;
       return BrandModle(
         id: document.id,
         name: data['Name'] ?? '',
         image: data['Image'] ?? '',
         isFeatured:data['Isfeatured'] ?? false,
         productCount: data['ProductCount'] ?? 0,
       );
     }else{
       return BrandModle.empty();
     }
    }
  }

