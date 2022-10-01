class Product {
  final String id;
  final String name;
  final String price;
  final String photoUrl;

  const Product({
    this.id = '0',
    required this.name,
    required this.price,
    this.photoUrl = ''
  });
}