import 'package:flutter/material.dart';
import '../widgets/Bars/Appbar.dart';
import '../widgets/Category/SubCategory/SubCategorySection.dart';

class SubCategoryScreen extends StatelessWidget {
  static const id='SubCategoryScreen';

  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title:'Skin Care',showBackArrow: true,height: 75,padd: const EdgeInsets.only(top: 45),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              //banner
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 12,right: 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(fit:BoxFit.contain ,image: AssetImage('images/skincare.jpg'),),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const SubCategorySection(Sectiontitle: 'Face Washes', itemscount: 2, Name: 'facewash', lable: 'Lightening Cleanser', price: 240, brand: 'Telofill',
              ),
              const SizedBox(height: 5,),
              const SubCategorySection(Sectiontitle: 'Face Moisturizers', itemscount: 3, Name: 'moist', lable: 'Facial Moisturizing Gel', price: 240, brand: 'Telofill',
              ),

            ],
          ),
        ),
      ),
    );
  }
}

