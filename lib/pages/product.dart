import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});

  String? get description => null;

  static fromJson(product) {}
}

class HomepPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'Product 1',
        price: 29.99,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Product 2',
        price: 19.99,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Product 3',
        price: 49.99,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Product 4',
        price: 9.99,
        imageUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text('${product.price} €'),
              onTap: () {
                // Action lors du clic sur un produit
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 20),
            Text(product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('${product.price} €', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomepPage(),
  ));
}
