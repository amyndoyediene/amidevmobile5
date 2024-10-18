import 'package:amimobile5/pages/maison/compte_creat.dart';
import 'package:amimobile5/pages/maison/compte_id.dart';
import 'package:flutter/material.dart';

class ComptePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compte'), // Le titre de la page dans l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connectez-vous pour acceder a votre compte', // Le titre principal au centre
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Espace entre le titre et le texte
            Text(
              'Insrivez-vous si vous navez pas de compte.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40), // Espace entre le texte et les boutons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Logique pour le premier bouton
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InscriptionPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Couleur du bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('sidentifier'),
                ),
                SizedBox(width: 20), // Espace entre les boutons
                ElevatedButton(
                  onPressed: () {
                    // Logique pour le deuxième bouton
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => creerPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Couleur du bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('Creer un compte'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
