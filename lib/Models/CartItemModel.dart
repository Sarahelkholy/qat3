class CartItemModel{
  String productId;
  String title;
  double price;
  double? saleprice;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String,String>? selectedVariation;

  CartItemModel({
   required this.productId,
   required this.quantity,
   this.variationId='',
   this.image,
   required this.price,
    this.saleprice,
   this.title='',
   this.brandName,
   this.selectedVariation
   });

  static CartItemModel empty()=> CartItemModel(productId: '', quantity: 0, price: 0);

  Map<String,dynamic> toJson(){
    return{
      'productId':productId,
      'title':title,
      'price':price,
      'saleprice':saleprice,
      'image':image,
      'quantity':quantity,
      'variationId':variationId,
      'brandName':brandName,
      'selectedVariation':selectedVariation
    };
  }

  factory CartItemModel.fromJson(Map<String,dynamic> json){
    return CartItemModel(
        productId: json['productId'],
        title: json['title'],
        price: json['price'],
        saleprice:json['saleprice'],
        image: json['image'],
        quantity: json['quantity'],
        variationId: json['variationId'],
        brandName: json['brandName'],
        selectedVariation: json['selectedVariation'] !=null?Map<String,String>.from(json['selectedVariation']):null,
    );
  }
}