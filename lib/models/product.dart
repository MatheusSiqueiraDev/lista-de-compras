class Product {
  String? id;
  String? name;
  String? price;
  String? photoUrl;

  Product(this.id, this.name, this.price, this.photoUrl);

  factory Product.fromMap(Map<String, dynamic> data) {
      return Product( 
         data['id'].toString(), 
         data['name'], 
         data['price'], 
         data['photoUrl']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "price": price, 
      "photoUrl": photoUrl
   }; 
}
