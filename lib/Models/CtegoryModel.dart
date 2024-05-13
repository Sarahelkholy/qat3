import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String image;
  final String name;
  final String id;
  final String parentid;
  final bool isfeatured;
  String? banner;
  CategoryModel({required this.id, required this.image,required this.name,required this.isfeatured, this.parentid='',this.banner});

  static CategoryModel empty()=>CategoryModel(id: '', image: '', name: '', isfeatured:false);

  Map<String,dynamic> toJson(){
    return{
      'Name':name,
      'Image':image,
      'Id':id,
      'ParentId':parentid,
      'IsFeatured':isfeatured,
      'Banner':banner
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data()!=null){
      final data=document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentid:data['ParentId'] ?? '',
        isfeatured: data['IsFeatured'] ?? false,
        banner: data['Banner']??'',
      );
    }
    else{
      return CategoryModel.empty();
    }
  }
}

