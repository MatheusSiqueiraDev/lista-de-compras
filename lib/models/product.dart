class Product {
  String? id;
  String? name;
  double? price;
  int? qty;
  int? listId;

  Product(this.id, this.name, this.price, this.qty, this.listId);

  factory Product.fromMap(Map<String, dynamic> data) {
      return Product( 
         data['id'].toString(), 
         data['name'], 
         data['price'],
         data['qty'],
         data['listId']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "price": price,
      "listId": listId
   }; 
}
