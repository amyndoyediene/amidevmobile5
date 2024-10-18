import 'package:amimobile5/pages/maison/panier.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos Categorie'),
        centerTitle: true,
        actions: [
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
        ],
      ),
      //

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher un produit, une marque...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            //
            // Ajout d'un espace vertical avec SizedBox
            SizedBox(height: 20), // Espace de 20 pixels
            // Section "Offres Électroménager"
            _buildSectionTitle('SOINS DU VISAGE'),
            _buildHorizontalProductList([
              _buildProductItem('Congélateur Horizontal', '105 900 FCFA',
                  '199 900 FCFA', 'assets/logoo.png'),
              _buildProductItem('Cuisinière à Gaz', '79 900 FCFA',
                  '95 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
            ]),
            // Section "Meilleures Offres Électroménager"
            _buildSectionTitle('SOINS DU CORPS'),
            _buildHorizontalProductList([
              _buildProductItem(
                  'Split Deska', '125 801 FCFA', '13%', 'assets/logoo.png'),
              _buildProductItem(
                  'Split Eco', '127 900 FCFA', '12%', 'assets/logoo.png'),
              _buildProductItem('Réfrigérateur Beko', '65 197 FCFA', null,
                  'assets/logoo.png'),
            ]),
            // Autre section (exemple TV)
            _buildSectionTitle('MAQUILLAGE'),
            // Vous pouvez ajouter d'autres produits ici si nécessaire
            _buildHorizontalProductList([
              _buildProductItem('Congélateur Horizontal', '105 900 FCFA',
                  '199 900 FCFA', 'assets/logoo.png'),
              _buildProductItem('Cuisinière à Gaz', '79 900 FCFA',
                  '95 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
              _buildProductItem('Split Eco Anti Corrosion', '124 800 FCFA',
                  '145 000 FCFA', 'assets/logoo.png'),
            ]),
          ],
        ),
      ),
    );
  }

  // Fonction pour générer le titre de la section
  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.pink,
      child: Text(
        title,
        textAlign: TextAlign.center, // Alignement du texte au centre
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Fonction pour générer le titre de la section avec "Voir tous"
  Widget _buildSectionWithSeeAll(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              // Action pour "Voir tous"
            },
            child: Text(
              'VOIR TOUS',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour générer la liste horizontale de produits
  Widget _buildHorizontalProductList(List<Widget> products) {
    return Container(
      height: 250, // Hauteur de la liste de produits
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products,
      ),
    );
  }

  // Fonction pour générer un élément de produit
  Widget _buildProductItem(
      String title, String price, String? oldPrice, String imagePath) {
    return Container(
      width: 160, // Largeur de chaque produit
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image du produit
          Image.asset(imagePath, height: 120, fit: BoxFit.cover),
          SizedBox(height: 8),
          // Titre du produit
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          // Prix du produit
          Text(
            price,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          // Ancien prix barré (optionnel)
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OffersPage(),
  ));
}
