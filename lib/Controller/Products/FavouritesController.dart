import 'dart:convert';

import 'package:get/get.dart';
import 'package:qat3/Data/LocalStorage.dart';
import 'package:qat3/Data/Repositories/ProductRepository.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Models/ProductModel.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance=>Get.find();

  final favourites=<String,bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void  initFavourites(){
    final json=LocalStorage.instance().readData('favourites');
    if(json!=null){
      final storedFavorites=jsonDecode(json) as Map<String,dynamic>;
      favourites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId){
    return favourites[productId]??false;
  }

  void toggleFavouriteProduct(String productId){
    if(!favourites.containsKey(productId)){
      favourites[productId]=true;
      saveFavoritesToStorage();
      Loaders.customToast(message: 'Product has been added to the Wishlist.');
    }
    else{
      LocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavoritesToStorage();
      favourites.refresh();
      Loaders.customToast(message: 'Product has been removed from the Wishlist.');
    }
  }

  void  saveFavoritesToStorage(){
    final encodedFavorites=json.encode(favourites);
    LocalStorage.instance().saveData('favourites', encodedFavorites);
  }

  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}