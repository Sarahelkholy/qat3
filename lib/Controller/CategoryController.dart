import 'package:get/get.dart';
import 'package:qat3/Data/Repositories/CategoryRepository.dart';
import 'package:qat3/Data/Repositories/ProductRepository.dart';
import 'package:qat3/Models/CtegoryModel.dart';
import 'package:qat3/Models/ProductModel.dart';

import '../Loader/Loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance=>Get.find();

  final isLoading=false.obs;
  final _categoryrepository=Get.put(CategoryRepository());
  RxList<CategoryModel> allcategories=<CategoryModel>[].obs;
  RxList<CategoryModel> featuredcategories=<CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  Future<void> fetchCategory() async{
    try{
      isLoading.value=true;
      final categories=await _categoryrepository.getAllCategories();
      allcategories.assignAll(categories);
      featuredcategories.assignAll(allcategories.where((category) => category.isfeatured&& category.parentid.isEmpty).take(8).toList());
    }catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
    }
    finally{
      isLoading.value=false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{
      final subCategories =await _categoryrepository.getSubCategories(categoryId);
      return subCategories;
    }catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
      return [];
    }
  }


  Future<List<ProductModel>> getCategoryProducts({required String categoryId,int limit=4}) async{
    try {
      final products = await ProductRepository.instance.getProductsForCategory(
          categoryId: categoryId, limit: limit);
      return products;
    }catch(e){
      Loaders.errorSnackBar(title: 'Opps....!',message: 'Something went wrong');
      return [];
    }
  }
}