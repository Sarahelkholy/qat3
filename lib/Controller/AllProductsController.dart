
import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/ProductRepository.dart';
import '../../Models/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Loader/Loaders.dart';

//,,,,'Most Popular'

class AllProductsController extends GetxController{
  static AllProductsController get instance=>Get.find();

  final repository= ProductRepository.instance;
  final RxString selectedSortOption='Name'.obs;
  final RxList<ProductModel> products=<ProductModel>[].obs;


  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async{
    try{
      if(query==null) return [];
      final products=await repository.fetchProductsByQuery(query);
      return products;
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
      return [];
    }
  }

  void sortProduct(String sortOption){
    selectedSortOption.value= sortOption;

    switch(sortOption){
      case'Name':
        products.sort((a,b)=>a.title.compareTo(b.title));
        break;
      case'Higher Price':
        products.sort((a,b)=>b.price.compareTo(a.price));
        break;
      case'Lower Price':
        products.sort((a,b)=>a.price.compareTo(b.price));
        break;
      case'Sales':
        products.sort((a,b){
          if(b.salePrice>0){
            return b.salePrice.compareTo(a.salePrice);
          }
          else if(a.salePrice>0){
            return -1;
          }
          else{
            return 1;
          }
        });
        break;
      default:
        products.sort((a,b)=>a.title.compareTo(b.title));
    }
  }


  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProduct('Name');
  }

}