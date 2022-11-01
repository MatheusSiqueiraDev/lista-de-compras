import 'package:lista_compras/models/product.dart';

class ListBuy {
  int? id;
  String? name;
  List? products;
  double? priceTotal;
  int? qtdProduct;

  ListBuy(this.id, this.name, this.products, this.priceTotal, this.qtdProduct);

  factory ListBuy.fromMap(Map<String, dynamic> data) {
      return ListBuy( 
         data['id'], 
         data['name'], 
         data['products'],
         data['priceTotal'],
         data['qtdProduct']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "products": products,
      "priceTotal": priceTotal,
      "qtdProduct": qtdProduct
   }; 
}