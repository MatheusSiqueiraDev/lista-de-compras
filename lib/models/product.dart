class Product {
  String? id;
  String? name;
  String? price;
  int? qty;

  Product(this.id, this.name, this.price, this.qty);

  factory Product.fromMap(Map<String, dynamic> data) {
      return Product( 
         data['id'].toString(), 
         data['name'], 
         data['price'],
         data['qty']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "price": price
   }; 
}
