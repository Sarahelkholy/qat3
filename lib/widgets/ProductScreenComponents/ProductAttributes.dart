
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qat3/Controller/Products/VariationController.dart';
import '../../Models/ProductModel.dart';
import '../ChoiceChep.dart';
import '../SectionHeading.dart';
class ProductAttributes extends StatelessWidget {
  final ProductModel product;
  const ProductAttributes({ required this.product});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VariationController());
    return Column(
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(title:attribute.name??'' ,showButton: false,padd: EdgeInsets.only(top: 13)),
              Obx(()=>
                 Wrap(
                  spacing:8 ,
                  children: attribute.values!.map((attributeValue){
                    final isSelected=controller.selectedAttributes[attribute.name]==attributeValue;
                    //here
                    final available = controller.getAttributesAvailabilityInVariation
                      (product.productVariation!, attribute.name!).contains(attributeValue);
                    return ChoiceChep(
                      label: attributeValue,selected: isSelected,
                      onselected: available? (selected){
                        if(selected &&available){controller.onAttributSelected(product, attribute.name??'', attributeValue);}
                      }:null);
                  }).toList()),
              ),
            ],
          ))
              .toList(),
        )
      ],
    );
  }
}