import 'package:flutter/material.dart';
import 'order_model.dart'; // Assurez-vous d'importer votre modèle de commande

class OrderHistoryPage extends StatelessWidget {
  // Exemple de données statiques (normalement, cela viendrait de votre base de données)
  final List<OrderModel> orders = [
    OrderModel(
      id: '1',
      productName: 'Produit 1',
      price: 25.99,
      status: 'En traitement',
      orderDate: DateTime.now().subtract(Duration(days: 1)),
    ),
    OrderModel(
      id: '2',
      productName: 'Produit 2',
      price: 45.50,
      status: 'Livré',
      orderDate: DateTime.now().subtract(Duration(days: 5)),
    ),
    OrderModel(
      id: '3',
      productName: 'Produit 3',
      price: 19.99,
      status: 'Livré',
      orderDate: DateTime.now().subtract(Duration(days: 10)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des commandes'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(order.productName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prix: \$${order.price.toStringAsFixed(2)}'),
                    Text('Date de commande: ${order.orderDate.toLocal()}'),
                    Text('Statut: ${order.status}',
                        style: TextStyle(
                          color: _getStatusColor(order.status),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Ajoutez une action si vous souhaitez montrer plus de détails
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // Une fonction pour changer la couleur du texte en fonction du statut de la commande
  Color _getStatusColor(String status) {
    switch (status) {
      case 'En traitement':
        return Colors.orange;
      case 'Livré':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
