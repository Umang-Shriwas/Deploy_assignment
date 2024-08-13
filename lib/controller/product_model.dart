class Product {
  final String name;
  final String image;
  final double price;
  final String description;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
    );
  }
}
