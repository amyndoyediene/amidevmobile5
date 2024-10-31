import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: OffersPage(),
  ));
}

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  final Map<String, Map<String, dynamic>> _cart =
      {}; // Panier pour stocker les produits ajoutés
int _cartItemCount = 0; // Compteur pour le nombre de produits dans le panier
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
         title: const Text('Decouvrez tous nos produits en promo!'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(cart: _cart)),
                  );
                },
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher un produit, une marque...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('POUR VOS MAISONS'),
            _buildHorizontalProductList([
              _buildProductItem('Fauteuil', '105 900 FCFA',
                  '199 900 FCFA', 'assets/fauteuil.png'),
              _buildProductItem('Tableau Decor', '79 900 FCFA',
                  '95 000 FCFA', 'assets/tab.png'),
              _buildProductItem('Fenetre', '79 900 FCFA',
                  '95 000 FCFA', 'assets/fene.png'),
              _buildProductItem('Porte', '79 900 FCFA',
                  '95 000 FCFA', 'assets/porte.png'),
            ]),
            _buildSectionTitle('POUR VOS ENFANTS'),
            _buildHorizontalProductList([
              _buildProductItem(
                  'Jeux', '125 801 FCFA', '13%', 'assets/jeu.jpg'),
              _buildProductItem(
                  'Chaussure', '127 900 FCFA', '12%', 'assets/chau.png'),
              _buildProductItem('Sacs', '65 197 FCFA', null,
                  'assets/sac1.png'),
            ]),
            _buildSectionTitle('FOURNITURES'),
            _buildHorizontalProductList([
              _buildProductItem(
                  'Bloc-note', '125 801 FCFA', '13%', 'assets/blocn.png'),
              _buildProductItem(
                  'Cahier', '127 900 FCFA', '12%', 'assets/cahi.png'),
              _buildProductItem('Crayon', '65 197 FCFA', null,
                  'assets/cra.png'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.pink,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildHorizontalProductList(List<Widget> products) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products,
      ),
    );
  }

   Widget _buildProductItem(String title, String price, String? oldPrice, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(imagePath, height: 120, fit: BoxFit.cover),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: IconButton(
                      icon: Icon(Icons.add_circle, color: Colors.pink),
                      onPressed: () {
                        setState(() {
                          if (_cart.containsKey(title)) {
                            _cart[title]!['quantity'] += 1;
                          } else {
                            _cart[title] = {'price': double.parse(price.split(' ')[0].replaceAll(',', '')), 'quantity': 1};
                          }
                          _cartItemCount++; // Incrémenter le compteur de produits
                        });
                        _showAlert(context, "$title ajouté au panier");
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(price, style: TextStyle(fontSize: 16, color: Colors.black)),
              if (oldPrice != null)
                Text(
                  oldPrice,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAlert(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class CartPage extends StatefulWidget {
  final Map<String, Map<String, dynamic>> cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.cart.values.fold(
      0,
      (sum, item) => sum + item['price'] * item['quantity'],
    );

    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Text("Panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                String productName = widget.cart.keys.elementAt(index);
                Map<String, dynamic> product = widget.cart[productName]!;
                return ListTile(
                  title: Text(productName),
                  subtitle: Text("Prix: ${product['price']} FCFA, Quantité: ${product['quantity']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (product['quantity'] > 1) {
                              product['quantity'] -= 1;
                            } else {
                              widget.cart.remove(productName);
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            product['quantity'] += 1;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Prix Total: ${totalPrice.toStringAsFixed(2)} FCFA",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
  

