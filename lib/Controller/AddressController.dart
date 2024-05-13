import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Data/NetworkManager.dart';
import 'package:qat3/Data/Repositories/AddressRepository.dart';
import 'package:qat3/Loader/FullScreenLoader.dart';
import 'package:qat3/Loader/Loaders.dart';
import 'package:qat3/Screens/Profile/Address/AddNewAddress.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
import 'package:qat3/widgets/ProfileSettingsScreen/AddressCard.dart';
import 'package:qat3/widgets/SectionHeading.dart';

import '../Models/AddressModel.dart';
import '../constants.dart';

class AddressController extends GetxController{
  static AddressController get instance=>Get.find();

  final name=TextEditingController();
  final phone=TextEditingController();
  final city=TextEditingController();
  final street=TextEditingController();
  GlobalKey<FormState> addressFormKey=GlobalKey<FormState>();

  RxList<AddressModel> alladdresses=<AddressModel>[].obs;
  RxBool refreshData=true.obs;
  final Rx<AddressModel> selectedAddress =AddressModel.empty().obs;
  final addressRepository=Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddresses() async{
    try{
      final addresses=await addressRepository.fetchUserAddress();
      selectedAddress.value=addresses.firstWhere((element) => element.selectedAddress,orElse: ()=>AddressModel.empty());
      alladdresses=addresses.obs;
      return addresses;

    }
    catch(e){
      Loaders.errorSnackBar(title: 'Address Not Found',message: e.toString());
      return[];
    }
  }

  Future selecteAddress(AddressModel newSelectedAddress) async{
    try{

      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      newSelectedAddress.selectedAddress=true;
      selectedAddress.value=newSelectedAddress;

      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Error in selection',message: e.toString());
    }
  }

  Future<dynamic> selecteNewAddressPopup(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (_)=>Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) )
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(title: 'Select Address',showButton: false,),
              FutureBuilder(
                  future: allUserAddresses(),
                  builder: (_,snapshot){
                    final response=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(response!=null) return response;

                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_,index)=>AddressCard(
                            address: snapshot!.data![index],
                            ontap: ()async{
                              await selecteAddress(snapshot.data![index]);
                              Get.back();
                            }
                            )
                    );
                  }
                  ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: KDarkBlue,
                ),
                  onPressed: ()=>Get.to(()=>AddNewAddress()),
                  child: const Text('Add new address',style: TextStyle(color: Colors.white
                  ),),
                ),
              )
            ],
          ),
        ));
  }

  Future addNewAddress() async{
    try{
    //  FullScreenLoader.openLoadingDialog(text, animation)
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }
      if(!addressFormKey.currentState!.validate()){
        return;
      }

      final address=AddressModel(
        id: '',
        name: name.text.trim(),
        phone: phone.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        selectedAddress: true
      );
      final id=await addressRepository.addAddress(address);

      address.id=id;
      await selecteAddress(address);
      alladdresses.add(address);
      Loaders.successSnackBar(title: 'Congratulations',message: 'Your address has been saved successfully');

      refreshData.toggle();
      resetFormFields();

      Navigator.of(Get.context!).pop();
    }
    catch(e){
      Loaders.errorSnackBar(title: 'Address not found',message: e.toString());
    }
  }
  void removeOne(AddressModel item){
    int index=alladdresses.indexWhere((address) => address.id==item.id);
    removeDialog(index);
    alladdresses.refresh();
  }

  void removeDialog(int index){
    Get.defaultDialog(
        backgroundColor: Colors.white,
        title: 'Delete Address',
        confirmTextColor: Colors.white,
        cancelTextColor: KDarkBlue,
        middleText: 'Are you sure you want to delete this address',
        onConfirm: (){
         alladdresses.removeAt(index);
         alladdresses.refresh();
          Loaders.customToast(message: 'Address deleted');
          Get.back();
        },
        onCancel: ()=>()=>Get.back()
    );
  }
  void  resetFormFields(){
    name.clear();
    phone.clear();
    street.clear();
    city.clear();
    addressFormKey.currentState?.reset();
  }
}