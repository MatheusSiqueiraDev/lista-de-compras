class Product {
  String? id;
  String? name;
  String? price;

  Product(this.id, this.name, this.price);

  factory Product.fromMap(Map<String, dynamic> data) {
      return Product( 
         data['id'].toString(), 
         data['name'], 
         data['price']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "price": price
   }; 
}
