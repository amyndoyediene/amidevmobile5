// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: OffersPage(),
//   ));
// }

// class OffersPage extends StatefulWidget {
//   @override
//   _OffersPageState createState() => _OffersPageState();
// }

// class _OffersPageState extends State<OffersPage> {
//   final Map<String, Map<String, dynamic>> _cart = {}; // Panier
//   int _cartItemCount = 0; // Compteur des produits dans le panier
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFC0CB),
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFC0CB),
//         title: const Text('Découvrez tous nos produits en promo!'),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CartPage(cart: _cart)),
//                   );
//                 },
//               ),
//               if (_cartItemCount > 0)
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: Container(
//                     padding: EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Text(
//                       '$_cartItemCount',
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Rechercher un produit, une marque...',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildSectionTitle('POUR VOS MAISONS'),
//             _buildHorizontalProductList([
//               _buildProductItem('Fauteuil', '105 900 FCFA', '199 900 FCFA', 'assets/fauteuil.png'),
//               _buildProductItem('Tableau Decor', '79 900 FCFA', '95 000 FCFA', 'assets/tab.png'),
//               _buildProductItem('Fenetre', '79 900 FCFA', '95 000 FCFA', 'assets/fene.png'),
//               _buildProductItem('Porte', '79 900 FCFA', '95 000 FCFA', 'assets/porte.png'),
//             ]),
//             _buildSectionTitle('POUR VOS ENFANTS'),
//             _buildHorizontalProductList([
//               _buildProductItem('Jeux', '125 801 FCFA', '13%', 'assets/jeu.jpg'),
//               _buildProductItem('Chaussure', '127 900 FCFA', '12%', 'assets/chau.png'),
//               _buildProductItem('Sacs', '65 197 FCFA', null, 'assets/sac1.png'),
//             ]),
//             _buildSectionTitle('FOURNITURES'),
//             _buildHorizontalProductList([
//               _buildProductItem('Bloc-note', '125 801 FCFA', '13%', 'assets/blocn.png'),
//               _buildProductItem('Cahier', '127 900 FCFA', '12%', 'assets/cahi.png'),
//               _buildProductItem('Crayon', '65 197 FCFA', null, 'assets/cra.png'),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       color: Colors.pink,
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildHorizontalProductList(List<Widget> products) {
//     return Container(
//       height: 250,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: products,
//       ),
//     );
//   }

//   Widget _buildProductItem(String title, String price, String? oldPrice, String imagePath) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(imagePath, height: 120, fit: BoxFit.cover),
//                   Positioned(
//                     bottom: 4,
//                     right: 4,
//                     child: IconButton(
//                       icon: Icon(Icons.add_circle, color: Colors.pink),
//                       onPressed: () {
//                         setState(() {
//                           if (_cart.containsKey(title)) {
//                             _cart[title]!['quantity'] += 1;
//                           } else {
//                             _cart[title] = {'price': double.parse(price.split(' ')[0].replaceAll(',', '')), 'quantity': 1};
//                           }
//                           _cartItemCount++;
//                         });
//                         _showAlert(context, "$title ajouté au panier");
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//               SizedBox(height: 4),
//               Text(price, style: TextStyle(fontSize: 16, color: Colors.black)),
//               if (oldPrice != null)
//                 Text(
//                   oldPrice,
//                   style: TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _showAlert(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
// }
// /////////////panier
// class CartPage extends StatefulWidget {
//   final Map<String, Map<String, dynamic>> cart;

//   CartPage({required this.cart});

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     double totalPrice = widget.cart.values.fold(
//       0,
//       (sum, item) => sum + item['price'] * item['quantity'],
//     );

//     return Scaffold(
//       backgroundColor: Color(0xFFFFC0CB),
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFC0CB),
//         title: Text("Panier"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.cart.length,
//               itemBuilder: (context, index) {
//                 String productName = widget.cart.keys.elementAt(index);
//                 Map<String, dynamic> product = widget.cart[productName]!;
//                 return ListTile(
//                   title: Text(productName),
//                   subtitle: Text("Prix: ${product['price']} FCFA, Quantité: ${product['quantity']}"),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.remove_circle_outline),
//                         onPressed: () {
//                           setState(() {
//                             if (product['quantity'] > 1) {
//                               product['quantity'] -= 1;
//                             } else {
//                               widget.cart.remove(productName);
//                             }
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.add_circle_outline),
//                         onPressed: () {
//                           setState(() {
//                             product['quantity'] += 1;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               "Prix Total: ${totalPrice.toStringAsFixed(2)} FCFA",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CheckoutPage(cart: widget.cart),
//                   ),
//                 );
//               },
//               child: Text("Valider la commande"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /////////comande
// class CheckoutPage extends StatefulWidget {
//   final Map<String, Map<String, dynamic>> cart;

//   CheckoutPage({required this.cart});

//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _address = '';
//   String _paymentMethod = 'Paiement à la livraison';

//   @override
//   Widget build(BuildContext context) {
//     double totalPrice = widget.cart.values.fold(
//       0,
//       (sum, item) => sum + item['price'] * item['quantity'],
//     );

//     return Scaffold(
//       backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan r
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan r
//         title: Text("Validation de la Commande"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Récapitulatif du Panier
//             Text("Récapitulatif du Panier", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.cart.length,
//                 itemBuilder: (context, index) {
//                   String productName = widget.cart.keys.elementAt(index);
//                   Map<String, dynamic> product = widget.cart[productName]!;
//                   return ListTile(
//                     title: Text(productName),
//                     subtitle: Text("Prix unitaire: ${product['price']} FCFA, Quantité: ${product['quantity']}"),
//                     trailing: Text("Total: ${(product['price'] * product['quantity']).toStringAsFixed(2)} FCFA"),
//                   );
//                 },
//               ),
//             ),
//             Divider(),
//             Text("Prix Total : ${totalPrice.toStringAsFixed(2)} FCFA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),

//             // Formulaire de Livraison
//             Text("Informations de Livraison", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Nom complet'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Veuillez entrer votre nom';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _name = value!,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Adresse de livraison'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Veuillez entrer votre adresse';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _address = value!,
//                   ),
//                   SizedBox(height: 20),

//                   // Options de Paiement
//                   Text("Mode de Paiement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   ListTile(
//                     title: Text("Paiement en ligne"),
//                     leading: Radio<String>(
//                       value: 'Paiement en ligne',
//                       groupValue: _paymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           _paymentMethod = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: Text("Paiement à la livraison"),
//                     leading: Radio<String>(
//                       value: 'Paiement à la livraison',
//                       groupValue: _paymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           _paymentMethod = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),

//             // Bouton de Confirmation
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     _showOrderConfirmationDialog(context);
//                   }
//                 },
//                 child: Text("Confirmer la Commande"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showOrderConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Commande Confirmée"),
//           content: Text("Merci $_name ! Votre commande sera livrée à $_address et le mode de paiement est $_paymentMethod."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.pop(context); // Ferme la page de validation de commande
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
