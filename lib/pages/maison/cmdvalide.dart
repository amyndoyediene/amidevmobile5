import 'package:amimobile5/pages/maison/marque.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Page de validation de commande
class ValidationCommandePage extends StatefulWidget {
  final List<Product> panier;
  final double total;
  

  ValidationCommandePage({required this.panier, required this.total});

  @override
  _ValidationCommandePageState createState() => _ValidationCommandePageState();
}

class _ValidationCommandePageState extends State<ValidationCommandePage> {
  final _formKey = GlobalKey<FormState>();

  String? _nom;
  String? _adresse;
  String _modePaiement = 'Paiement en ligne';

  // Méthode pour sauvegarder une commande
  Future<void> _sauvegarderCommande() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Créer un objet commande
    final commande = {
      'nom': _nom,
      'adresse': _adresse,
      'modePaiement': _modePaiement,
      'total': widget.total,
      'panier': widget.panier.map((p) => {
        'name': p.name,
        'quantity': p.quantity,
        'price': p.price,
      }).toList(),
      'date': DateTime.now().toIso8601String(),
    };

    // Récupérer l'historique des commandes
    List<String> commandes = prefs.getStringList('historiqueCommandes') ?? [];
    commandes.add(jsonEncode(commande));

    // Sauvegarder la liste mise à jour
    await prefs.setStringList('historiqueCommandes', commandes);
  }

  // Modifiez la fonction de confirmation pour inclure l'enregistrement
  void _confirmerCommande() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _sauvegarderCommande(); // Sauvegarder la commande

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Commande confirmée'),
          content: Text('Merci, $_nom. Votre commande est en cours de traitement.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Retour au panier
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB),
        title: Text('Validation de commande'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Récapitulatif du panier
            Expanded(
              child: ListView.builder(
                itemCount: widget.panier.length,
                itemBuilder: (context, index) {
                  final product = widget.panier[index];
                  return ListTile(
                    leading: Image.asset(product.imagePath, width: 50),
                    title: Text(product.name),
                    subtitle: Text('Quantité: ${product.quantity}'),
                    trailing: Text('\$${(product.price * product.quantity).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Formulaire d'informations de livraison
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nom complet'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre nom';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nom = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Adresse de livraison'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre adresse';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _adresse = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Sélection du mode de paiement
            Text('Sélectionnez le mode de paiement :'),
            ListTile(
              title: const Text('Paiement en ligne'),
              leading: Radio<String>(
                value: 'Paiement en ligne',
                groupValue: _modePaiement,
                onChanged: (value) {
                  setState(() {
                    _modePaiement = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Paiement à la livraison'),
              leading: Radio<String>(
                value: 'Paiement à la livraison',
                groupValue: _modePaiement,
                onChanged: (value) {
                  setState(() {
                    _modePaiement = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            // Total et bouton de confirmation
            Text(
              'Total: \$${widget.total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Logique de validation et de commande ici
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Commande confirmée'),
                      content: Text('Merci, $_nom. Votre commande est en cours de traitement.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop(); // Retourner au panier
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Confirmer la commande'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
