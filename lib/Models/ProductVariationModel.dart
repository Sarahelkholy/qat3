
import 'package:qat3/Models/ProductModel.dart';

class ProductVariationModel {
  final String id;
  String image;
  String? description;
  int stock;
   double price;
   double salePrice;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.stock = 0,
    this.image = '',
    this.description = '',
    required this.attributeValues,
    this.price=0.0,this.salePrice=0.0
  });

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Stock': stock,
      'AttributeValues': attributeValues,
      'Price':price,
      'SalePrice':salePrice,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return ProductVariationModel.empty();
      return ProductVariationModel(
        id: data['Id'] ?? '',
        stock: int.parse((data['Stock'] ?? 0).toString()),
        image: data['Image'] ?? '',
        description: data['Description'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        attributeValues: Map<String, String>.from(data['AttributeValues'])??{},
      );
    }
  }


