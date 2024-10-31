import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ORPage(),
    );
  }
}

List<CartItem> panier = [];
ValueNotifier<int> panierCount = ValueNotifier<int>(0);

class ORPage extends StatefulWidget {
  @override
  _CresoPageState createState() => _CresoPageState();
}

class _CresoPageState extends State<ORPage> {
  bool isGridView = true;
  String searchQuery = ""; // Variable pour stocker le texte de recherche

  // Méthode pour obtenir les produits filtrés
  List<Product> get filteredProducts {
    if (searchQuery.isEmpty) {
      return products; // Affiche tous les produits si la barre de recherche est vide
    }
    return products.where((product) {
      return product.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Text('Ordinateur'),
        elevation: 1,
        //leading: Icon(Icons.arrow_back, color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Icon(Icons.search, color: Colors.black),
          // SizedBox(width: 10),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanierPage()),
                  );
                },
              ),
              Positioned(
                right: 4,
                top: 4,
                child: ValueListenableBuilder(
                  valueListenable: panierCount,
                  builder: (context, value, child) {
                    return value > 0
                        ? Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '$value',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : SizedBox();
                  },
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Rechercher un produit",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                  icon: Icon(Icons.sort, color: Colors.pink),
                  label: Text(
                    "Trier",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // Row(
                //   children: [
                //     Icon(Icons.grid_view, color: Colors.grey),
                //     SizedBox(width: 8),
                //     Icon(Icons.list, color: Colors.grey),
                //   ],
                // ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isGridView ? 2 : 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: isGridView ? 0.7 : 3,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Code du modèle de produit et des autres classes reste inchangé
// ... (conserver le reste du code inchangé)

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final bool isNew;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isNew = false,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  void _ajouterAuPanier(BuildContext context) {
    var existingItem = panier.firstWhere(
        (item) => item.product.name == product.name,
        orElse: () => CartItem(product: product));

    if (panier.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      panier.add(existingItem);
    }

    panierCount.value = panier.length;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Produit ajouté"),
          content: Text("${product.name} a été ajouté au panier"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if (product.isNew)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Nouveau',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          Expanded(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  product.price,
                  style: TextStyle(color: Colors.pink, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Icon(Icons.star_border, color: Colors.yellow, size: 16),
                      ],
                    ),
                    IconButton(
                      onPressed: () => _ajouterAuPanier(context),
                      icon: Icon(Icons.add, color: Colors.pink),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// la page de panier
class PanierPage extends StatefulWidget {
  @override
  _PanierPageState createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  double _calculerPrixTotal() {
    return panier.fold(0, (total, item) {
      return total +
          (double.parse(item.product.price.split(" ")[0]) * item.quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
        title: Text('Mon Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: panier.length,
              itemBuilder: (context, index) {
                final item = panier[index];
                return ListTile(
                  leading: Image.network(item.product.imageUrl),
                  title: Text(item.product.name),
                  subtitle: Text("${item.product.price} x ${item.quantity}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              panier.removeAt(index);
                            }
                            panierCount.value = panier.length;
                          });
                        },
                        icon: Icon(Icons.remove, color: Colors.red),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                            panierCount.value = panier.length;
                          });
                        },
                        icon: Icon(Icons.add, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            panier.removeAt(index);
                            panierCount.value = panier.length;
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
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
              "Prix Total: ${_calculerPrixTotal().toStringAsFixed(2)} CFA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ValidationCommandePage()),
                );
              },
              child: Text("Valider la commande"),
            ),
          ),
        ],
      ),
    );
  }
}

// Liste des produits exemple
List<Product> products = [
  Product(
    name: "ROCHE-POSE Lait pour tout le Corps",
    price: "4900 CFA",
    imageUrl: "assets/ordi1.png",
    isNew: true,
  ),
  Product(
    name: "SUNSPROTECTION Creme Masque Viasge",
    price: "3800 CFA",
    imageUrl: "assets/ordi.jpeg",
    isNew: true,
  ),
  
  
];

//////
class ValidationCommandePage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  String modePaiement = "Paiement en ligne"; // Valeur par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Text('Validation de la Commande'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Récapitulatif de la commande",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...panier.map((item) => ListTile(
                  title: Text(item.product.name),
                  subtitle: Text("${item.product.price} x ${item.quantity}"),
                )),
            Divider(),
            Text("Informations de livraison"),
            TextField(
              controller: nomController,
              decoration: InputDecoration(labelText: "Nom"),
            ),
            TextField(
              controller: adresseController,
              decoration: InputDecoration(labelText: "Adresse"),
            ),
            SizedBox(height: 20),
            Text("Mode de paiement"),
            RadioListTile(
              title: Text("Paiement en ligne"),
              value: "Paiement en ligne",
              groupValue: modePaiement,
              onChanged: (value) {
                // setState(() {
                //   modePaiement = value!;
                // });
              },
            ),
            RadioListTile(
              title: Text("Paiement à la livraison"),
              value: "Paiement à la livraison",
              groupValue: modePaiement,
              onChanged: (value) {
                // setState(() {
                //   modePaiement = value!;
                // });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Afficher le message de confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor:
                        Color(0xFFB0006B), // Couleur d'arrière-plan rose foncé
                    content: Text("Commande validée avec succès."),
                    duration: Duration(seconds: 2),
                  ),
                );

                // Vous pouvez ajouter ici le code pour vider le panier ou rediriger l'utilisateur
                // Vider le panier
                panier.clear();
                panierCount.value = 0;

                // Retourner à la page principale ou une autre action
                Navigator.pop(
                    context); // Optionnel : retour à la page précédente
              },
              child: Text("Passer la commande"),
            ),
          ],
        ),
      ),
    );
  }
}
