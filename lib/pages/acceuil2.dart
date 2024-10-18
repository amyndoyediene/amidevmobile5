import 'package:amimobile5/pages/maison/category.dart';
import 'package:amimobile5/pages/maison/compte.dart';
import 'package:amimobile5/pages/maison/maison.dart';
import 'package:amimobile5/pages/maison/maison.dart';
import 'package:amimobile5/pages/maison/panier.dart';
import 'package:amimobile5/pages/search.dart';
import 'package:flutter/material.dart';

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur notre plateforme e-commerce',
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
                  iconColor: Colors.pink, // Couleur rose pour l'icône
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EaPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.search,
                  label: 'Rechercher',
                  iconColor: Colors.pink, // Couleur rose pour l'icône
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.category,
                  label: 'Categorie',
                  onPressed: () {
                    // Action pour le bouton
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
                    // Action pour le bouton
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PanierPage()),
                    );
                  },
                ),
                _buildBottomNavButton(
                  icon: Icons.account_balance,
                  label: 'Compte',
                  onPressed: () {
                    // Action pour le bouton
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

//des widget pour colorer l'icone
  Widget _buildBottomNavButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color iconColor = Colors.pink, // Paramètre pour la couleur de l'icône
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(icon, color: iconColor), // Utilisation de iconColor
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

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommercePage(),
    ));
