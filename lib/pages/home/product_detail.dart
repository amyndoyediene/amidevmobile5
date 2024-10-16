import 'package:amimobile5/pages/product.dart';
import 'package:flutter/material.dart';
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 16),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("${product.price} €", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('product.description', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(product.name),
  //     ),
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             // Image du produit
  //             Image.network(product.imageUrl),
  //             SizedBox(height: 16),

  //             // Nom et prix du produit
  //             Text(
  //               product.name,
  //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               "${product.price} €",
  //               style: TextStyle(fontSize: 20, color: Colors.green),
  //             ),
  //             SizedBox(height: 16),

  //             // Description du produit
  //             Text(
  //               "Description",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(height: 8),
  //             Text(
  //               product.description,
  //               style: TextStyle(fontSize: 16),
  //             ),
  //             SizedBox(height: 16),

  //             // Spécifications du produit (optionnelles)
  //             Text(
  //               "Spécifications",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(height: 8),
  //             _buildSpecifications(), // Widget qui pourrait afficher les spécifications si disponible

  //             SizedBox(height: 16),

  //             // Avis des utilisateurs (optionnel)
  //             Text(
  //               "Avis des utilisateurs",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(height: 8),
  //             _buildUserReviews(), // Widget qui pourrait afficher les avis

  //             SizedBox(height: 20),

  //             // Bouton "Ajouter au panier"
  //             Center(
  //               child: ElevatedButton.icon(
  //                 onPressed: () {
  //                   // Action à ajouter pour gérer l'ajout au panier
  //                   _addToCart(context);
  //                 },
  //                 icon: Icon(Icons.shopping_cart),
  //                 label: Text("Ajouter au panier"),
  //                 style: ElevatedButton.styleFrom(
  //                   primary: Colors.blue, // Couleur du bouton
  //                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  //                   textStyle: TextStyle(fontSize: 16),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

   // Exemple de méthode pour afficher les spécifications du produit
  // Widget _buildSpecifications() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("Poids: 1.2kg", style: TextStyle(fontSize: 16)),
  //       Text("Dimensions: 20 x 10 x 5 cm", style: TextStyle(fontSize: 16)),
  //       // Ajoutez d'autres spécifications ici
  //     ],
  //   );
  // }
  //

}
