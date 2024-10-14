import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Entrez votre recherche',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                // Logique de recherche ici, par exemple appeler une API ou filtrer une liste
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour lancer la recherche
                String searchQuery = _searchController.text;
                // Ici vous pouvez rediriger vers une autre page ou afficher des résultats
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Résultat de recherche'),
                    content: Text('Vous avez recherché: $searchQuery'),
                    actions: [
                      TextButton(
                        child: Text('Fermer'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text('Rechercher'),
            ),
          ],
        ),
      ),
    );
  }
}
