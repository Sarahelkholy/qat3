import '../Data/Validator.dart';

class PaymentModel{
  String name;
  String image;
  String? cardnum;
  PaymentModel({required this.name,required this.image,this.cardnum});
  static PaymentModel empty()=>PaymentModel(name: '', image: '');
}