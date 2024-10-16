import 'package:amimobile5/pages/maison/panier.dart';
import 'package:flutter/material.dart';

class MaisonPage extends StatelessWidget {
  const MaisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Utilisation de Row pour organiser les widgets
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image centrée
            Image.asset(
              'assets/fat.jpg', // Remplacez par le chemin de votre image
              height: 40, // Ajustez la taille de l'image
              width: 200,
            ),
            Spacer(), // Permet de pousser les icônes vers la droite
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Action pour le panier
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PanierPage()),
                    );
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Action pour le home
              },
            ),
          ],
        ),
        centerTitle: true, // Pour centrer le contenu de l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher un produit, une marque...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  _buildCategoryItem('SOINS DU VISAGE',
                      'assets/ami41.jpeg'), // Remplacez par l'image appropriée
                  _buildCategoryItem('CHEVEUX', 'assets/ami41.jpeg'),
                  _buildCategoryItem('MAQUILLAGE', 'assets/ami41.jpeg'),
                  _buildCategoryItem('SOINS DU CORPS', 'assets/ami41.jpeg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              imagePath,
              height: 350, // Taille de l'image
              width: 350, // Taille de l'image
              fit: BoxFit.cover, // Assure que l'image couvre tout l'espace
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MaisonPage(),
  ));
}
