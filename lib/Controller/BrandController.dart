import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/ProductRepository.dart';
import 'package:qat3/Models/BrandModel.dart';
import 'package:qat3/Models/ProductModel.dart';

import '../Data/Repositories/BrandRepository.dart';
import '../Loader/Loaders.dart';

class BrandController extends GetxController{
  static BrandController get instance=>Get.find();
  RxBool isLoading=true.obs;
  final RxList<BrandModle> allBrands=<BrandModle>[].obs;
  final RxList<BrandModle> featuredBrands=<BrandModle>[].obs;
  final brandRepository=Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void>  getFeaturedBrands() async{
    try{
      isLoading.value=true;
      final brands=await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured??false).take(4));
    }catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
    }
    finally{
      isLoading.value=false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId) async{
    try{
      final products=await ProductRepository.instance.getProductsForBrand(brandId: brandId);
      return products;
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
      return [];
    }

  }
}