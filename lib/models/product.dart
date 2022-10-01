class Product {
  dynamic id;
  dynamic name;
  dynamic price;
  dynamic photoUrl;

  Product({
    this.id = '0',
    required this.name,
    required this.price,
    this.photoUrl = ''
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
} 