import 'package:flutter/material.dart';

class EaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink, // Fond rose
      appBar: AppBar(
        backgroundColor: Colors.pink, // Fond rose
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icône du menu à gauche
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Action pour le menu
              },
            ),
            // Image centrée au milieu
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/fat.jpg', // Remplacez par le chemin de votre image
                  height: 40, // Ajustez la taille de l'image
                  width: 200,
                ),
              ),
            ),
            // Icônes "panier" et "home" à droite
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Action pour le panier
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Action pour la page d'accueil
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Rechercher un produit, une marque...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Section des produits avec images cliquables
            _buildSectionTitle('Nos Produits'),
            _buildProductGrid(context),
          ],
        ),
      ),
    );
  }

  // Fonction pour générer le titre de la section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Fonction pour générer une grille de produits
  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: NeverScrollableScrollPhysics(), // Évite les conflits de scroll
        children: [
          _buildProductItem(context, 'Homme', 'assets/homme.jpeg'),
          _buildProductItem(context, 'Femme', 'assets/femme.jpeg'),
          _buildProductItem(context, 'Enfant', 'assets/enfant.jpeg'),
          _buildProductItem(context, 'Parfum', 'assets/parfum.jpeg'),
          _buildProductItem(context, 'Cheveux', 'assets/cheveux.jpeg'),
          _buildProductItem(context, 'Marque', 'assets/marque.png'),
          //   _buildProductItem(context, 'Produit 4', 'assets/inscri.png'),
          //   _buildProductItem(context, 'Produit 4', 'assets/inscri.png'),
        ],
      ),
    );
  }

  // Fonction pour générer un produit individuel
  Widget _buildProductItem(
      BuildContext context, String productName, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Action lors du clic sur un produit
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsPage(productName)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Image du produit
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Nom du produit sur l'image
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.black54,
                child: Text(
                  productName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page de détails du produit
class ProductDetailsPage extends StatelessWidget {
  final String productName;

  ProductDetailsPage(this.productName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Text(
          'Détails du $productName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EaPage(),
  ));
}
