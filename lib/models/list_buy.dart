import 'package:lista_compras/models/product.dart';

class ListBuy {
  int? id;
  String? name;
  double? priceTotal;
  int? qtdProduct;

  ListBuy(this.id, this.name, this.priceTotal, this.qtdProduct);

  factory ListBuy.fromMap(Map<String, dynamic> data) {
      return ListBuy( 
         data['id'], 
         data['name'], 
         data['priceTotal'],
         data['qtdProduct']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "priceTotal": priceTotal,
      "qtdProduct": qtdProduct
   }; 
}