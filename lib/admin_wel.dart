import 'package:flutter/material.dart';

class AdminwelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
        title: Text(
            'Bienvenue administrateur'), // Le titre de la page dans l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenue Admin!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 40), // Espace entre le texte et les boutons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Logique pour le premier bouton
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => InscriptionPage()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Couleur du bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('Gerer les produits'),
                ),
                SizedBox(width: 20), // Espace entre les boutons
                ElevatedButton(
                  onPressed: () {
                    // Logique pour le deuxième bouton
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => creerPage()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Couleur du bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('Gerer les stock et les prix'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
