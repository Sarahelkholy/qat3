
import 'package:qat3/Models/BrandModel.dart';
import 'package:qat3/Models/ProductAttributeModel.dart';
import 'package:qat3/Models/ProductModel.dart';

import 'Models/CtegoryModel.dart';
import 'Models/ProductModel.dart';

class DummyData{
  static final List<CategoryModel> categorie=[
    CategoryModel(id: '1',image:'images/logos/1.png',name:'Clothes' ,isfeatured: true ),
    CategoryModel(id: '2',image:'images/logos/2.png',name:'Accessorize' ,isfeatured: true ),
    CategoryModel(id: '3',image:'images/logos/3.png',name:'Make-Up' ,isfeatured: true ),
    CategoryModel(id: '4',image:'images/logos/5.png',name:'SelfCare' ,isfeatured: true ),
    CategoryModel(id: '5',image:'images/logos/6.png',name:'Shoes' ,isfeatured: true ),
    CategoryModel(id: '6',image:'images/logos/7.png',name:'Pants' ,isfeatured: true ),
    CategoryModel(id: '7',image:'images/logos/8.png',name:'Bags' ,isfeatured: true ),
  ];
  /*static final List<ProductModel> products=[
    ProductModel(thumbnail: "images/products/7/1.webp",
        isfeatured: true,
        images: [
          "images/products/7/1.webp",
          "images/products/7/2.webp",
          "images/products/7/3.webp",
          "images/products/7/4.webp"
        ],
        description: "Coconut oil, beeswax, shea butter, vitamin E, Vanilla fragerance, mica color",
        brand: BrandModle(id:"6", image: "images/brands/6.jpg", isFeatured: true, name: "Soul & More",productCount: 10)
        , id: '022',
        salePrice: 300,
        categoryId: '2',
        productAttributes: [
          ProductAttributeModel(name: "Secents",values: ["Vanilla", "Strawberry ","White Musk","Bubble Gum"])
        ],
        title: "Vanilla Body Butter", price: 330, productType: "ProductType.Variable",
        stock: 20,
    )
  ];*/
}