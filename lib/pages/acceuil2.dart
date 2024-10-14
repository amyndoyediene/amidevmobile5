import 'package:amimobile5/pages/search.dart';
import 'package:amimobile5/pages/product.dart';
import 'package:flutter/material.dart';

class EcommercePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur notre plateforme e-commerce',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(4.0),
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Bouton Home
                  _buildBottomNavButton(
                    icon: Icons.home,
                    label: 'Home',
                    onPressed: () {
                      // Action pour le bouton Home
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomepPage()),
                      );
                    },
                  ),
                  // Bouton Rechercher
                  _buildBottomNavButton(
                    icon: Icons.search,
                    label: 'Rechercher',
                    onPressed: () {
                      // Action pour le bouton Rechercher
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                  ),
                  // Bouton Admin
                  Column(
                    children: [
                      _buildBottomNavButton(
                        icon: Icons.admin_panel_settings,
                        label: 'Admin',
                        onPressed: () {
                          // Action pour le bouton Admin
                        },
                      ),
                    ],
                  ),
                  // Bouton Détails
                  _buildBottomNavButton(
                    icon: Icons.details,
                    label: 'Détails',
                    onPressed: () {
                      // Action pour le bouton Détails
                    },
                  ),
                  // Bouton Historique
                  _buildBottomNavButton(
                    icon: Icons.history,
                    label: 'Historique',
                    onPressed: () {
                      // Action pour le bouton Historique
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fonction pour créer un bouton de navigation
  Widget _buildBottomNavButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          iconSize: 30.0,
        ),
        Text(label),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Masque le badge de débogage
      home: EcommercePage(),
    ));
