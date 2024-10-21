import 'package:amimobile5/pages/maison/cmdvalide.dart';
import 'package:flutter/material.dart';

// Modèle de produit pour simplifier la gestion des produits
class Product {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}

class EaPage extends StatefulWidget {
  @override
  _EaPageState createState() => _EaPageState();
}

class _EaPageState extends State<EaPage> {
  List<Product> panier = [];
  int totalItemsInCart = 0; // Variable pour suivre le nombre total d'articles

  // Fonction pour ajouter un produit au panier
  void _addToCart(Product product) {
    setState(() {
      panier.add(product);
      totalItemsInCart++; // Augmenter le nombre d'articles
    });

    // Afficher un message d'alerte lorsqu'un produit est ajouté
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Produit ajouté au panier"),
          content: Text("${product.name} a été ajouté au panier avec succes."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Fonction pour mettre à jour le panier
  void _updateCart(List<Product> updatedCart) {
    setState(() {
      panier = updatedCart;
      totalItemsInCart = panier.fold(
          0, (sum, item) => sum + item.quantity); // Mettre à jour le total
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/fat.jpg',
                  height: 40,
                  width: 200,
                ),
              ),
            ),
            Row(
              children: [
                //
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PanierPage(
                              panier: panier, onPanierUpdate: _updateCart)),
                    );
                  },
                ),
                //
// Afficher le badge avec le nombre d'articles
                if (totalItemsInCart >
                    0) // Vérifiez si le nombre est supérieur à zéro
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Center(
                        child: Text(
                          totalItemsInCart.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            //
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
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
            // Section des produits
            _buildProductGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildProductItem(
            context,
            Product(
              name: 'Amazon',
              imagePath: 'assets/amazon.png',
              description: 'Un produit Amazon de haute qualité',
              price: 99.99,
            ),
          ),
          _buildProductItem(
            context,
            Product(
              name: 'Voiture',
              imagePath: 'assets/toyota.jpeg',
              description: 'Une superbe voiture Toyota',
              price: 19999.99,
            ),
          ),
          _buildProductItem(
            context,
            Product(
              name: 'Telephone',
              imagePath: 'assets/markpho.jpeg',
              description: 'Des iphone de dernière génération',
              price: 19999.99,
            ),
          ),
          _buildProductItem(
            context,
            Product(
              name: 'Maquillage',
              imagePath: 'assets/maqui.jpeg',
              description: 'Des maquillage pour être plus belle',
              price: 19999.99,
            ),
          ),
          _buildProductItem(
            context,
            Product(
              name: 'Cheveux',
              imagePath: 'assets/markchev.png',
              description: 'Rendez vos cheveux plus lisses',
              price: 19999.99,
            ),
          ),
          _buildProductItem(
            context,
            Product(
              name: 'Parfum',
              imagePath: 'assets/markpar.jpg',
              description: 'Parfum de luxe pour sentir bon tout le temps',
              price: 79.99,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              product: product,
              onAddToCart: _addToCart,
            ),
          ),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                product.imagePath,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.black54,
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.white,
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

  // void _updateCart(List<Product> updatedCart) {
  //   setState(() {
  //     panier = updatedCart;
  //   });
  // }
}

// Page du panier
class PanierPage extends StatefulWidget {
  final List<Product> panier;
  final Function(List<Product>) onPanierUpdate;

  PanierPage({required this.panier, required this.onPanierUpdate});

  @override
  _PanierPageState createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  double _calculateTotalPrice() {
    double total = 0.0;
    widget.panier.forEach((product) {
      total += product.price * product.quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Text('Panier'),
      ),
      body: widget.panier.isEmpty
          ? Center(child: Text('Votre panier est vide'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.panier.length,
                    itemBuilder: (context, index) {
                      final product = widget.panier[index];
                      return ListTile(
                        leading: Image.asset(product.imagePath, width: 50),
                        title: Text(product.name),
                        subtitle: Text(
                            'Prix: \$${product.price.toStringAsFixed(2)}\nQuantité: ${product.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (product.quantity > 1) {
                                    product.quantity--;
                                  }
                                });
                                widget.onPanierUpdate(widget.panier);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  product.quantity++;
                                });
                                widget.onPanierUpdate(widget.panier);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  widget.panier.removeAt(index);
                                });
                                widget.onPanierUpdate(widget.panier);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Total: \$${_calculateTotalPrice().toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Redirection vers la page de validation de commande
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ValidationCommandePage(
                                panier: widget.panier,
                                total: _calculateTotalPrice(),
                              ),
                            ),
                          );
                        },
                        child: Text('Valider la commande'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 50),
                          backgroundColor: Colors.green,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

//page de detail produit
class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  ProductDetailsPage({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.imagePath,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  onAddToCart(product);
                  Navigator.pop(context); // Retourne à la page précédente
                },
                child: Text('Ajouter au panier'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
