import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/CartSCreenComponents/CartItems.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/AddressSection.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/PaymentAmountSection.dart';
import 'package:qat3/widgets/CheckOutScreenComponents/PaymentSection.dart';
import '../widgets/Bars/Appbar.dart';
import '../widgets/CheckOutScreenComponents/CoponContainer.dart';
import 'SuccessPayment.dart';
class CheckOutScreen extends StatelessWidget {
  static const id='CheckOut';

  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

        appBar:Appbar(title: 'Order review',showBackArrow: true,height: 85,padd: const EdgeInsets.only(top: 30),),
      body: SingleChildScrollView(
        
        child: Container(
          decoration: const BoxDecoration(color: KBackground,
              borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const CartItems(showAddRemove: false,),
                    const SizedBox(height: 10,),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(top: 8,right: 8,left: 10,bottom: 8),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: KLightGray)
                      ) ,
                      child: Row(
                        children: [
                          const Flexible(
                            child: CoponContainer(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                                backgroundColor: KLightGray
                            ), child: const Text('Apply',style: TextStyle(color: KDarkGray),),),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.white),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        children: [
                          PaymentAmountSection(),
                          SizedBox(height: 8,),
                          Divider(thickness: 2,),
                          PaymentSection(),
                          AddressSection(),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, SuccessPayment.id);
        } ,style: ElevatedButton.styleFrom(
            backgroundColor: KDarkBlue
        ),child: const Text('Pay now',style: TextStyle(color: Colors.white,fontSize: 15),), ),
      ),
    );
  }
}

