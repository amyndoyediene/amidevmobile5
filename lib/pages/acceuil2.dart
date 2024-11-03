import 'package:amimobile5/pages/acceuil3.dart';
import 'package:amimobile5/pages/acceuil4.dart';
import 'package:amimobile5/pages/maison/promo.dart';
import 'package:amimobile5/pages/maison/compte.dart';
import 'package:amimobile5/pages/maison/home.dart';
import 'package:amimobile5/pages/maison/categoriee.dart';
import 'package:flutter/material.dart';

class EcommercePage extends StatefulWidget {
  const EcommercePage({super.key});

  @override
  _EcommercePageState createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  List<Product> panier = [];
  int totalItemsInCart = 0;

  void _updateCart(List<Product> updatedCart) {
    setState(() {
      panier = updatedCart;
      totalItemsInCart = panier.fold(0, (sum, item) => sum + item.quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'assets/amsa.jpg', // Assurez-vous que cette image est bien dans le dossier assets
              fit: BoxFit.cover, // Pour couvrir toute la page
            ),
          ),
          // Contenu de la page
          Column(
            children: <Widget>[
              AppBar(
                backgroundColor:
                    Colors.transparent, // Pour laisser voir l'image derrière
                title: const Text('Accueil'),
                centerTitle: true,
              ),
              const Center(
                child: Text(
                  'Bienvenue sur notre plateforme e-commerce Amsashop, appelez au 70 656 76 54 pour commander',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors
                        .white, // Assurez-vous que le texte est visible sur l'image
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
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
                      MaterialPageRoute(builder: (context) => EaPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.category,
                  label: 'Categori',
                  iconColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CaPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.category_sharp,
                  label: 'En promo!',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HoPage()),
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
