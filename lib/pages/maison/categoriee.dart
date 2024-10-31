
import 'package:amimobile5/produitdetail/cremesol.dart';
import 'package:amimobile5/produitdetail/cuisi.dart';
import 'package:amimobile5/produitdetail/frigo.dart';
import 'package:amimobile5/produitdetail/maqui.dart';
import 'package:amimobile5/produitdetail/ordi.dart';
import 'package:amimobile5/produitdetail/tv.dart';
import 'package:flutter/material.dart';

class CaPage extends StatefulWidget {
  @override
  _CaPageState createState() => _CaPageState();
}

class _CaPageState extends State<CaPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> categories = [
    {
      'title': 'Crème solaire',
      'image': 'assets/solaire.jpeg',
      'page': CresoPage()
    },
    {
      'title': 'Maquillage',
      'image': 'assets/maqui.jpeg',
      'page': MAPage()
    },
    {'title': 'Smart TV', 'image': 'assets/tv.jpeg', 'page': TVPage()},
    {
      'title': 'Ordinateur',
      'image': 'assets/ordi.jpeg',
      'page': ORPage()
    },
    {
      'title': 'Réfrigérateur',
      'image': 'assets/frigo.jpg',
      'page': FriPage()
    },
    {
      'title': 'Machine à laver',
      'image': 'assets/laver.jpeg',
      'page': MAPage()
    },
    {'title': 'Cuisine', 'image': 'assets/cui.jpeg', 'page': CuiPage()},
  ];

  // Liste filtrée des catégories
  List<Map<String, dynamic>> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories =
        categories; // Initialement, toutes les catégories sont affichées
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Fonction de filtrage des catégories
  void _filterCategories() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCategories = categories.where((category) {
        return category['title']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Catégories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un produit, une marque...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),

            // Titre des catégories
            Center(
              child: Text(
                'Vos catégories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Grille des catégories
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 3 colonnes
                crossAxisSpacing: 8, // Espace entre colonnes
                mainAxisSpacing: 8, // Espace entre lignes
                childAspectRatio: 0.8, // Ajustement pour occuper plus d'espace
                children: filteredCategories.map((category) {
                  return _buildCategoryItem(
                      category['title']!, category['image']!, category['page']);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour chaque catégorie
  Widget _buildCategoryItem(String title, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image circulaire
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, // Carré pour l'image circulaire
              child: ClipOval(
                child: Container(
                  color: Colors.grey[200],
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          // Titre de la catégorie
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Exemple des pages de navigation
class EcommerceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ecommerce Home Page')),
      body: Center(child: Text('Bienvenue à la page E-commerce')),
    );
  }
}

class ValidationCommandePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Validation de Commande')),
      body: Center(child: Text('Page de validation de commande')),
    );
  }
}

class SomeOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Autre Page')),
      body: Center(child: Text('Page par défaut pour d\'autres catégories')),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CaPage(),
  ));
}
