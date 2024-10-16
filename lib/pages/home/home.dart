import 'package:amimobile5/pages/home/home_screen.dart';
import 'package:amimobile5/pages/home/product_list.dart';
import 'package:amimobile5/pages/product.dart';
import 'dart:convert'; // Pour convertir JSON en objets Dart
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts() as Future<List<Product>>;  // Assurez-vous que cette méthode retourne Future<List<Product>>
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produits disponibles"),
        actions: [
          // L'icône de recherche utilise le produit une fois qu'il est chargé
          FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(); // Attendez que les produits soient chargés pour afficher l'icône
              } else if (snapshot.hasError) {
                return IconButton(
                  icon: Icon(Icons.error),
                  onPressed: () {},
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(snapshot.data!), // Passer la liste de produits chargée
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else {
            return ProductList(products: snapshot.data!); // Passez la liste de produits une fois chargée
          }
        },
      ),
    );
  }
}

// Correction du delegate de recherche pour accepter une liste de produits, pas Future
class ProductSearchDelegate extends SearchDelegate {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('${product.price} €'),
          onTap: () {
            close(context, product);
            // Naviguer vers la page de détails du produit si nécessaire
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) => product.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('${product.price} €'),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      },
    );
  }
}
