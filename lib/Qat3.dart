import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Bindings/GeneralBinding.dart';
import 'package:qat3/Screens/CartScreen.dart';
import 'package:qat3/Screens/CheckOutScreen.dart';
import 'package:qat3/Screens/Profile/Address/AddNewAddress.dart';
import 'package:qat3/Screens/Profile/Address/AddressScreen.dart';
import 'package:qat3/Screens/Profile/ProfileScreen.dart';
import 'package:qat3/Screens/Start/RegisterScreen.dart';
import 'package:qat3/Screens/Start/WelcomeScreen.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Class/ChepTheme.dart';
import 'package:qat3/widgets/NavigationMenu.dart';
import 'Screens/Brands/AllBrandScreen.dart';
import 'Screens/Brands/BrandProducts.dart';
import 'Screens/Product/AllProductScreen.dart';
import 'Screens/Product/ProductDetailsScreen.dart';
import 'Screens/Product/ProductReviewsScreen.dart';
import 'Screens/Profile/Orders/OrderScreen.dart';
import 'Screens/Start/LoginScreen.dart';
import 'Screens/Product/HomePage.dart';
import 'Screens/SubCategoryScreen.dart';
import 'Screens/SuccessPayment.dart';

class QAT3 extends StatelessWidget {
  const QAT3({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(chipTheme: ChepTheme.light),
      debugShowCheckedModeBanner: false,
      initialRoute:WelcomeScreen.id,
      initialBinding: GeneralBinding(),
      routes: {
        WelcomeScreen.id:(context)=>const WelcomeScreen(),
        LoginScreen.id:(context)=>const LoginScreen(),
        RegisterScreen.id:(context)=>const RegisterScreen(),
        HomePage.id:(context)=>const HomePage(),
        NavigationMenu.id:(context)=>const NavigationMenu(),
        ProfileScreen.id:(context)=>const ProfileScreen(),
        ProductDetails.id:(context)=>const ProductDetails(),
        AddressScreen.id:(context)=>const AddressScreen(),
        AddNewAddress.id:(context)=>const AddNewAddress(),
        CartScreen.id:(context)=>const CartScreen(),
        CheckOutScreen.id:(context)=>const CheckOutScreen(),
        SuccessPayment.id:(context)=>const SuccessPayment(),
        OrderScreen.id:(context)=>const OrderScreen(),
        SubCategoryScreen.id:(context)=>const SubCategoryScreen(),
        AllProductScreen.id:(context)=>const AllProductScreen(),
        AllBrandScreen.id:(context)=>const AllBrandScreen(),
        BrandProducts.id:(context)=>const BrandProducts(),
        ProductReviewsScreen.id:(context)=>const ProductReviewsScreen(),
      },
      home: const Scaffold(backgroundColor: KBackground,body: Center(child: CircularProgressIndicator(color: KDarkBlue,),),),
    );
  }
}