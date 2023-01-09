class Product {
  String? id;
  String? name;
  double? price;
  int? qty;
  int? listId;
  int? buy;

  Product(this.id, this.name, this.price, this.qty, this.listId, this.buy);

  factory Product.fromMap(Map<String, dynamic> data) {
      return Product( 
         data['id'].toString(), 
         data['name'], 
         data['price'],
         data['qty'],
         data['listId'],
         data['buy']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "price": price,
      "listId": listId,
      "buy": buy
   }; 
}
