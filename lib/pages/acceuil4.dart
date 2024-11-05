import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HoPage(),
    );
  }
}

class HoPage extends StatefulWidget {
  @override
  _HoPageState createState() => _HoPageState();
}

class _HoPageState extends State<HoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB), // Couleur de l'appBar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Retour à la page précédente
          },
         
        ),
        
        title: Center(
          child: Image.asset(
            'assets/ams.png', // Remplacez par le logo réel
            height: 40,
          ),
        ),
        actions: [
          SizedBox(width: 48), // Pour compenser l'espace de l'icône de droite et centrer le titre
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un produit, une marque',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 900, // Ajoutez cette ligne pour définir la largeur
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset('assets/fene.png', fit: BoxFit.contain),
                  Image.asset('assets/robe.png', fit: BoxFit.contain),
                  Image.asset('assets/fauteuil.png', fit: BoxFit.contain),
                ],
              ),
            ),
            SizedBox(height: 100),
            _buildCategorySection(),
            SizedBox(height: 100),
            Text(
              'Livraison en moins de 24h sur tout le senegal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 70),
            _buildNewInStockSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    List<Map<String, String>> categories = [
      {"title": "Protections\nsolaires", "image": "assets/creso1.png"},
      {"title": "Soins anti taches &\npoints noirs", "image": "assets/creso2.jpg"},
      {"title": "Peaux à tendance\nacnéique", "image": "assets/creso3.png"},
      {"title": "Éclat des peaux\nternes", "image": "assets/creso4.png"},
    ];
    
    return Container(
  height: 120, // Augmentez légèrement la hauteur
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0), // Ajustez l'espacement ici si nécessaire
        child: Column(
          mainAxisSize: MainAxisSize.min, // Limite la taille de la colonne pour éviter l'overflow
          children: [
            CircleAvatar(
              radius: 25, // Réduit légèrement la taille de l'avatar
              backgroundImage: AssetImage(categories[index]["image"]!),
            ),
            SizedBox(height: 10), // Diminue l'espacement
            Flexible(
              child: Text(
                categories[index]["title"]!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11), // Réduit la taille de la police
              ),
            ),
          ],
        ),
      );
    },
  ),
);

  }

  Widget _buildNewInStockSection() {
    List<Map<String, String>> products = [
      {"title": "Produit 1", "image": "assets/mark1.png"},
      {"title": "Produit 2", "image": "assets/mark2.png"},
      {"title": "Produit 3", "image": "assets/mark5.png"},
    ];
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'À Nouveau en Stock',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset(products[0]["image"]!, fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Image.asset(products[1]["image"]!, fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Image.asset(products[2]["image"]!, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
         
Text(
  'Decouvrez tous nos produits en PROMO!',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
),
 SizedBox(height: 20),
            _buildSectionTitle('POUR VOS MAISONS'),
            _buildHorizontalProductList([
              _buildProductItem('Fauteuil', '105 900 FCFA', '199 900 FCFA', 'assets/fauteuil.png'),
              _buildProductItem('Tableau Decor', '79 900 FCFA', '95 000 FCFA', 'assets/tab.png'),
              _buildProductItem('Fenetre', '79 900 FCFA', '95 000 FCFA', 'assets/fene.png'),
              _buildProductItem('Porte', '79 900 FCFA', '95 000 FCFA', 'assets/porte.png'),
            ]),
            _buildSectionTitle('POUR VOS ENFANTS'),
            _buildHorizontalProductList([
              _buildProductItem('Jeux', '125 801 FCFA', '13%', 'assets/jeu.jpg'),
              _buildProductItem('Chaussure', '127 900 FCFA', '12%', 'assets/chau.png'),
              _buildProductItem('Sacs', '65 197 FCFA', null, 'assets/sac1.png'),
            ]),
            _buildSectionTitle('FOURNITURES'),
            _buildHorizontalProductList([
              _buildProductItem('Bloc-note', '125 801 FCFA', '13%', 'assets/blocn.png'),
              _buildProductItem('Cahier', '127 900 FCFA', '12%', 'assets/cahi.png'),
              _buildProductItem('Crayon', '65 197 FCFA', null, 'assets/cra.png'),
            ]),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Vos Marques Favorites',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset('assets/mark4.png', fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Image.asset('assets/mark3.png', fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    
  }
}

Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.pink,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
                        // setState(() {
                        //   if (_cart.containsKey(title)) {
                        //     _cart[title]!['quantity'] += 1;
                        //   } else {
                        //     _cart[title] = {'price': double.parse(price.split(' ')[0].replaceAll(',', '')), 'quantity': 1};
                        //   }
                        //   _cartItemCount++;
                        // });
                        // _showAlert(context, "$title ajouté au panier");
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
                  style: TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough),
                ),
            ],
          ),
        ],
      ),
    );
  }
