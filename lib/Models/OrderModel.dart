import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qat3/Enums.dart';
import 'package:qat3/Models/AddressModel.dart';
import 'package:qat3/widgets/Class/HelperFunction.dart';

import 'CartItemModel.dart';

class OrderModel{
  final String id;
  final String Userid;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.Userid='',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod='Cash on delivery',
    this.address,
    this.deliveryDate
});

  String get formattedOrderDate=>HelperFunction.getFormatedDate(orderDate);
  String get formattedDeliveryDAte=>deliveryDate!=null? HelperFunction.getFormatedDate(deliveryDate!):'';

  String get orderStatusText=>status==OrderStatus.delivered
      ? 'Delivered'
      :status==OrderStatus.shipped?
      'Shipment on the way'
      :'Processing';

  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'Userid':Userid,
      'status':status.toString(),
      'totalAmount':totalAmount,
      'orderDate':orderDate,
      'paymentMethod':paymentMethod,
      'address':address?.toJson(),
      'deliveryDate':deliveryDate,
      'items':items.map((item) => item.toJson()).toList()
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    final data=snapshot.data() as Map<String,dynamic>;
    return OrderModel(
        id:data['id'] as String,
      Userid: data['Userid'] as String,
      status: OrderStatus.values.firstWhere((e) => e.toString()==data['status']),
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      address: AddressModel.formMap(data['address'] as Map<String,dynamic>),
      deliveryDate: data['deliveryDate']==null?null:(data['deliveryDate'] as Timestamp).toDate(),
      items: (data['items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String,dynamic>)).toList()

    );
  }

}