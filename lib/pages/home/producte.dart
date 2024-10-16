class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String category;
  final int popularity;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.popularity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      category: json['category'],
      popularity: json['popularity'],
    );
  }
}
