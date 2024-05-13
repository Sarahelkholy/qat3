
class ProductAttributeModel {
   String? name;
  final List<String>? values;

  ProductAttributeModel({this.name,this.values});


    toJson() {
    return {
      'Name': name, 'Values': values};
  }

  static ProductAttributeModel empty()=>ProductAttributeModel(name: '',values: []);

    factory ProductAttributeModel.fromJson(Map<String, dynamic> document)
    {
      final data=document;
      if(data.isEmpty) {
        return ProductAttributeModel();
      }
      return ProductAttributeModel(
        name:data.containsKey('Name')? data['Name']:'',
        values: List<String>.from(data['Values']),
      );
    }
  }