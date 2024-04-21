
import 'package:flutter/material.dart';
import '../ChoiceChep.dart';
import '../SectionHeading.dart';
class ProductAttributes extends StatelessWidget {
  const ProductAttributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Color',showButton: false,padd: EdgeInsets.only(top: 13)),
            Wrap(
              spacing:4 ,
              children: [
                ChoiceChep(label: 'white', selected: false,onselected: (value){},),
                ChoiceChep(label: 'black', selected: false,onselected: (value){},),
                ChoiceChep(label: 'gray', selected: false,onselected: (value){},),
                ChoiceChep(label: 'babyblue', selected: true,onselected: (value){},),
              ],
            ),
            const SectionHeading(title: 'Size',showButton: false,padd: EdgeInsets.only(top: 13)),
            Wrap(
              spacing: 4,
              children: [
                ChoiceChep(label: 'XS', selected: true,onselected: (value){},),
                ChoiceChep(label: 'S', selected: false,onselected: (value){},),
                ChoiceChep(label: 'M', selected: false,onselected: (value){},),
                ChoiceChep(label: 'L', selected: false,onselected: (value){},),
                ChoiceChep(label: 'XL', selected: false,onselected: (value){},),
              ],
            )
          ],
        ),
        /*
        SizedBox(height: 20,),
        //variation

        Container(
          decoration: BoxDecoration(
            color: KBackground,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SectionHeading(title:'Variation',showButton: false,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             ProductTitleText(title: 'Price:', size: 15,weight: FontWeight.w600,color: KDarkBlue,),
                             ProductPrice(price: '250',lineThrogh: true,size: 13,color: KDarkBlue,),
                             SizedBox(width: 4,),
                             ProductPrice(price: '200',size: 13,color: KDarkBlue,),
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          children: [
                             ProductTitleText(title: 'Statues:', size: 15,weight: FontWeight.w600,color: KDarkBlue),
                             SizedBox(height: 3,),
                             ProductTitleText(title: 'In stock', size: 15,color: KDarkBlue),
                          ],
                        )

                      ],
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ProductTitleText(title: 'this is the variation description', size: 14,maxlines: 4,color: KDarkBlue,weight: FontWeight.w400,),
                )

              ],
            ),
          ),
        ),*/


      ],
    );
  }
}