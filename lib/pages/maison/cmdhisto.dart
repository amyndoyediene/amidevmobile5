import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistoriqueCommandesPage extends StatefulWidget {
  @override
  _HistoriqueCommandesPageState createState() =>
      _HistoriqueCommandesPageState();
}

class _HistoriqueCommandesPageState extends State<HistoriqueCommandesPage> {
  List<Map<String, dynamic>> _historiqueCommandes = [];

  @override
  void initState() {
    super.initState();
    _chargerHistoriqueCommandes();
  }

  // Exemple de code pour sauvegarder une commande dans SharedPreferences
  Future<void> _sauvegarderCommande(Map<String, dynamic> commande) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> commandes = prefs.getStringList('historiqueCommandes') ?? [];
    commandes.add(jsonEncode(commande));
    await prefs.setStringList('historiqueCommandes', commandes);
  }

  // Charger l'historique des commandes depuis SharedPreferences
  Future<void> _chargerHistoriqueCommandes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> commandes = prefs.getStringList('historiqueCommandes') ?? [];
    setState(() {
      _historiqueCommandes =
          commandes.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des commandes'),
        backgroundColor: Color(0xFFFFC0CB),
      ),
      body: _historiqueCommandes.isEmpty
          ? Center(child: Text('Aucune commande passée.'))
          : ListView.builder(
              itemCount: _historiqueCommandes.length,
              itemBuilder: (context, index) {
                final commande = _historiqueCommandes[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Commande du ${commande['date']}'),
                    subtitle: Text(
                        'Total: \$${commande['total']} - ${commande['modePaiement']}'),
                    onTap: () {
                      _afficherDetailsCommande(commande);
                    },
                  ),
                );
              },
            ),
    );
  }

  // Fonction pour afficher les détails de la commande avec les produits
  void _afficherDetailsCommande(Map<String, dynamic> commande) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Détails de la commande'),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Nom: ${commande['nom']}'),
                  Text('Adresse: ${commande['adresse']}'),
                  Text('Mode de paiement: ${commande['modePaiement']}'),
                  Text('Total: \$${commande['total']}'),
                  SizedBox(height: 10),
                  Text('Produits:'),
                  ...List<Widget>.from(
                    commande['panier'].map((p) => Text(
                          '${p['name']} x${p['quantity']} - \$${(p['price'] * p['quantity']).toStringAsFixed(2)}',
                        )),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
