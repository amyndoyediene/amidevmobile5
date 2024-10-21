import 'package:amimobile5/pages/hoome.dart';
import 'package:amimobile5/pages/maison/category.dart';
import 'package:amimobile5/pages/maison/compte.dart';
import 'package:amimobile5/pages/maison/marque.dart';
import 'package:amimobile5/pages/maison/marque.dart';
import 'package:amimobile5/pages/maison/panier.dart';
import 'package:flutter/material.dart';

class EcommercePage extends StatefulWidget {
  const EcommercePage({super.key});

  @override
  _EcommercePageState createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  List<Product> panier = []; // Définir la variable panier
  int totalItemsInCart = 0; // Pour suivre le nombre d'articles

  // Fonction pour mettre à jour le panier
  void _updateCart(List<Product> updatedCart) {
    setState(() {
      panier = updatedCart;
      totalItemsInCart = panier.fold(
          0,
          (sum, item) =>
              sum + item.quantity); // Mettre à jour le nombre d'articles
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
        title: const Text('Accueil'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur notre plateforme e-commerce Amsashop, appelez au 70 656 76 54 pour commander',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildBottomNavButton(
                  icon: Icons.home,
                  label: 'Accueil',
                  iconColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HoomePage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.search,
                  label: 'Rechercher',
                  iconColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EaPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.category,
                  label: 'Categorie',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OffersPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.shopping_basket,
                  label: 'Panier',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PanierPage(
                          panier: panier,
                          onPanierUpdate: _updateCart,
                        ),
                      ),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.account_balance,
                  label: 'Compte',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComptePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color iconColor = Colors.pink,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(icon, color: iconColor),
            onPressed: onPressed,
            iconSize: 24.0,
          ),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
