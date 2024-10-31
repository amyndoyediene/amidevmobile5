// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'product_model.dart';

// class HoomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HoomePage> {
//   List<Product> products = [];
//   String selectedCategory = 'Toutes';
//   double selectedPrice = 50.0;
//   String selectedSort = 'Popularité';
//   TextEditingController searchController = TextEditingController();
//   String searchQuery = '';

//   @override
//   void initState() {
//     super.initState();
//     loadProducts();
//   }

//   Future<void> loadProducts() async {
//     final String response = await rootBundle.loadString('assets/products.json');
//     final data = json.decode(response) as List;
//     setState(() {
//       products =
//           data.map((productJson) => Product.fromJson(productJson)).toList();
//     });
//   }

//   List<Product> get filteredProducts {
//     return products.where((product) {
//       bool matchesCategory =
//           selectedCategory == 'Toutes' || product.category == selectedCategory;
//       bool matchesPrice = product.price <= selectedPrice;
//       bool matchesSearch =
//           product.name.toLowerCase().contains(searchQuery.toLowerCase());
//       return matchesCategory && matchesPrice && matchesSearch;
//     }).toList()
//       ..sort((a, b) {
//         if (selectedSort == 'Prix') {
//           return a.price.compareTo(b.price);
//         } else {
//           return b.popularity.compareTo(a.popularity);
//         }
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Action pour le panier
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => PanierePage()),
//               // );
//             },
//           ),
//         ],
//         title: TextField(
//           controller: searchController,
//           decoration: InputDecoration(
//             hintText: 'Rechercher un produit...',
//           ),
//           onChanged: (query) {
//             setState(() {
//               searchQuery = query;
//             });
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           // Dropdown pour filtrer par catégorie
//           DropdownButton<String>(
//             value: selectedCategory,
//             onChanged: (value) {
//               setState(() {
//                 selectedCategory = value!;
//               });
//             },
//             items: ['Toutes', 'Pour femme', 'Pour homme'].map((category) {
//               return DropdownMenuItem<String>(
//                 value: category,
//                 child: Text(category),
//               );
//             }).toList(),
//           ),

//           // Slider pour filtrer par prix
//           Slider(
//             value: selectedPrice,
//             min: 0,
//             max: 100,
//             divisions: 10,
//             label: '${selectedPrice.toStringAsFixed(2)} €',
//             onChanged: (value) {
//               setState(() {
//                 selectedPrice = value;
//               });
//             },
//           ),

//           // Dropdown pour trier par popularité ou prix
//           DropdownButton<String>(
//             value: selectedSort,
//             onChanged: (value) {
//               setState(() {
//                 selectedSort = value!;
//               });
//             },
//             items: ['Popularité', 'Prix'].map((sortOption) {
//               return DropdownMenuItem<String>(
//                 value: sortOption,
//                 child: Text(sortOption),
//               );
//             }).toList(),
//           ),

//           // Affichage de la liste horizontale des produits
//           Expanded(
//             child: products.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ProductList(products: filteredProducts),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Widget pour afficher la liste horizontale des produits
// class ProductList extends StatelessWidget {
//   final List<Product> products;

//   ProductList({required this.products});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal, // Disposition horizontale des produits
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return Card(
//           child: Container(
//             width:
//                 200, // Largeur des cartes de produits pour s'adapter horizontalement
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   product.image,
//                   height: 120, // Ajuster la taille de l'image
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     product.name,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text('${product.price.toStringAsFixed(2)} €'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(product.description),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
