class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;
  final String category;
  final double popularity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.popularity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
      popularity: json['popularity'].toDouble(),
    );
  }
}
