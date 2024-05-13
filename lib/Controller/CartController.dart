import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/Products/VariationController.dart';
import 'package:qat3/Data/LocalStorage.dart';
import 'package:qat3/Enums.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Models/ProductModel.dart';
import 'package:qat3/constants.dart';

import '../Models/CartItemModel.dart';

class CartController extends GetxController{
  static CartController get instance=>Get.find();

  RxInt noOfCartItems=0.obs;
  RxDouble totalCartPrice=0.0.obs;
  RxInt productQuantityInCart=0.obs;
  RxList<CartItemModel> cartItems=<CartItemModel>[].obs;
  final variationController=VariationController.instance;

  CartController(){
    loadCartItems();
  }

  void addToCart(ProductModel product){
    if(productQuantityInCart.value<1){
      Loaders.customToast(message: 'Select Quantity');
      return;
    }

    if(product.productType==ProductType.Variable.toString()&&variationController.selectedVariation.value.id.isEmpty){
      Loaders.customToast(message: 'Select Variation');
      return;
    }

    if(product.productType==ProductType.Variable.toString()){
      if(variationController.selectedVariation.value.stock<1){
        Loaders.warningSnackBar(title: 'Sorry..!',message: 'Selected Variation is out of stock.');
        return;
      }
    }else{
      if(product.stock<1){
        Loaders.warningSnackBar(title: 'Sorry..!',message: 'Selected product is out of stock.');
        return;
      }
    }

    final selectedCartItem=convertToCartItem(product, productQuantityInCart.value);

    int index=cartItems
        .indexWhere((cartItem) => cartItem.productId==selectedCartItem.productId&& cartItem.variationId==selectedCartItem.variationId);

    if(index>=0){
      cartItems[index].quantity=selectedCartItem.quantity;
    }
    else{
      cartItems.add(selectedCartItem);
    }

    updateCart();
    Loaders.customToast(message: 'Your Product has been added to the cart.');
  }

  void addOneToCart(CartItemModel item){
    int index= cartItems.indexWhere((cartItem) => cartItem.productId==item.productId&&cartItem.variationId==item.variationId);
    if(index>=0){
      cartItems[index].quantity+=1;
    }
    else{
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item){
    int index=cartItems.indexWhere((cartItem) => cartItem.productId==item.productId&&cartItem.variationId==item.variationId);
    if(index>=0){
      if(cartItems[index].quantity>1){
        cartItems[index].quantity-=1;
      }
      else{
        cartItems[index].quantity==1? removeFromCartDialog(index):cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index){
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: 'Remove product',
      confirmTextColor: Colors.white,
      cancelTextColor: KDarkBlue,
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(message: 'Product removed from cart');
        Get.back();
      },
      onCancel: ()=>()=>Get.back()
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product){
    if(product.productType==ProductType.Single.toString()){
      productQuantityInCart.value=getProductQuantityInCart(product.id);
    }
    else{
      final variationId=variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value=getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value=0;
      }
    }
  }

  CartItemModel convertToCartItem(ProductModel product,int quantity){
    if(product.productType==ProductType.Single.toString()){
      variationController.resetSelectionAttributes();
    }

    final variation =variationController.selectedVariation.value;
    final isVariation=variation.id.isNotEmpty;
    final price= product.salePrice>0.0?
            product.salePrice:
            product.price;

    return CartItemModel(productId: product.id,
        title: product.title,
        price: price,
        saleprice: product.salePrice,
        quantity: quantity,
    variationId: variation.id,
    image: isVariation?variation.image:product.thumbnail,
    brandName: product.brand!=null?product.brand!.name:'',
    selectedVariation: isVariation? variation.attributeValues:null);
  }

  void  updateCart(){
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void  updateCartTotals(){
    double calculateTotalPrice=0.0;
    int calculateNoOfItems=0;

    for(var item in cartItems){
      item.saleprice!=0? calculateTotalPrice +=(item.saleprice!) * item.quantity.toDouble():
      calculateTotalPrice +=(item.price) * item.quantity.toDouble();
      calculateNoOfItems+=item.quantity;
    }

    totalCartPrice.value=calculateTotalPrice;
    noOfCartItems.value=calculateNoOfItems;
  }

  void saveCartItems(){
    final cartItemStrings=cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems(){
    final cartItemsStrings=LocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(cartItemsStrings!=null){
      cartItems.assignAll(cartItemsStrings.map((item) => CartItemModel.fromJson(item as Map<String,dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId){
    final foundItem=
        cartItems.where((item) => item.productId==productId).fold(0, (previousValue, element) => previousValue+element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId,String variationId){
    final foundItem=cartItems.firstWhere(
            (item) => item.productId==productId&&item.variationId==variationId,
    orElse: ()=>CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart(){
    productQuantityInCart.value=0;
    cartItems.clear();
    updateCart();
  }
}