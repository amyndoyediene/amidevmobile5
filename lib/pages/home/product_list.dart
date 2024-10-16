import 'package:amimobile5/pages/product.dart';
import 'package:flutter/material.dart';
class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            leading: Image.network(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text("${product.price} €"),
            onTap: () {
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
    );
  }
}
