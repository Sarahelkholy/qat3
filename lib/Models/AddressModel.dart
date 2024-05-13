import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qat3/Data/Validator.dart';

class AddressModel{
  String id;
  final  String name;
  final  String phone;
  final  String street;
  final  String city;
  final  DateTime? dateTime;
  bool selectedAddress;

  AddressModel({required this.id,required this.name, required this.phone, required this.street, required this.city, this.dateTime,this.selectedAddress=true });


  String? get formattedPhoneNo =>Validator.validatePhone(phone);


  static AddressModel empty()=>AddressModel(id: '', name: '', phone: '', street: '', city: '',);

  Map<String,dynamic> toJson(){
    return{
      'Id':id,
      'Name':name,
      'Phone':phone,
      'Street':street,
      'City':city,
      'DateTime':DateTime.now(),
      'SelectedAddress':selectedAddress
    };
  }

  factory AddressModel.formMap(Map<String,dynamic> data){
    return AddressModel(
        id: data['Id'] as String,
        name: data['Name'] as String,
        phone: data['Phone'] as String,
        street: data['Street'] as String,
        city: data['City'] as String,
      selectedAddress: data['SelectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate()
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
    final data=snapshot.data() as Map<String,dynamic>;
    return AddressModel(
        id: snapshot.id,
        name: data['Name']??'',
        phone: data['Phone'] ??'',
        street: data['Street']??'',
        city: data['City']??'',
        selectedAddress: data['SelectedAddress'] as bool,
        dateTime: (data['DateTime'] as Timestamp).toDate()
    );
  }

  @override
  String toString() {
    return '$street,$city';
  }
}