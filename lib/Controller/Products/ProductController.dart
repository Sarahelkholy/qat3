import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:qat3/Enums.dart';
import 'package:qat3/Models/ProductModel.dart';

import '../../Data/Repositories/ProductRepository.dart';
import '../../Loader/Loaders.dart';

class ProductController extends GetxController{
  static ProductController get instace=>Get.find();
  final isLoading=false.obs;
  final productRepository=Get.put(ProductRepository());
//change to product
  RxList<ProductModel> featuredProducts= <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

   Future<void>  fetchFeaturedProducts()async {
    try{
      isLoading.value=true;
      final products=await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
    }
    finally{

      isLoading.value=false;
    }
  }

  Future<List<ProductModel>>  fetchAllFeaturedProducts()async {
    try{
      final products=await productRepository.getAllFeaturedProducts();
      return products;
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
      return [];
    }
  }

  String getProductPrice(ProductModel product){
    double price=double.infinity;
    if(product.productType==ProductType.Variable.toString()){
      price= (product.salePrice>0? product.salePrice:product.price);
    }
    else if(product.productType==ProductType.Single.toString()){
      price= (product.salePrice>0? product.salePrice:product.price);
    }
    return price.toString();
  }

  String? calculateSalePercentage(double orignalPrice,double? salePrice){
    if(salePrice==null ||salePrice<=0.0) return null;
    if(orignalPrice <=0.0) return null;
    double percentage=((orignalPrice-salePrice)/orignalPrice)*100;
    return percentage.toStringAsFixed(0) ;
  }

  String getStockStatus(int stock){
    return stock>0? 'In Stock' :'Out Of Stock';
  }
}