import 'package:get/get.dart';
import 'package:qat3/Controller/Products/ImagesController.dart';
import 'package:qat3/Models/ProductModel.dart';
import 'package:qat3/Models/ProductVariationModel.dart';

class VariationController extends GetxController{
  static VariationController get instance=>Get.find();

  RxMap selectedAttributes={}.obs;
  RxString variationStockStatus=''.obs;
  Rx<ProductVariationModel> selectedVariation=ProductVariationModel.empty().obs;

  void onAttributSelected(ProductModel product,attributeName,attributeValue){
    final selectedAttributes=Map<String,dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName]=attributeValue;
    this.selectedAttributes[attributeName]=attributeValue;

    final selectedVariation=product.productVariation!.firstWhere(
            (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
    orElse: ()=> ProductVariationModel.empty(),
    );

    if(selectedVariation.image.isNotEmpty){
      ImagesController.instance.selectedProductImage.value=selectedVariation.image;
    }

    this.selectedVariation.value=selectedVariation;
    getProductVariationStockStatus();


  }

  bool _isSameAttributeValues(Map<String,dynamic> variationAttributes,Map<String,dynamic> selectedAttributes){
    if(variationAttributes.length!=selectedAttributes.length) return false;
    for(final key in variationAttributes.keys){
      if(variationAttributes[key]!= selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations,String attributeName){
    final availableVariationAttributeValuse=variations.where((variation) =>
    variation.attributeValues[attributeName]!=null&&variation.attributeValues[attributeName]!.isNotEmpty&&variation.stock>0).map((variation)
    => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValuse;
  }

  void getProductVariationStockStatus(){
    variationStockStatus.value=selectedVariation.value.stock>0?'In Stock':'Out Of Stock';
  }

  void resetSelectionAttributes(){
    selectedAttributes.clear();
    variationStockStatus.value='';
    selectedVariation.value=ProductVariationModel.empty();
  }
}