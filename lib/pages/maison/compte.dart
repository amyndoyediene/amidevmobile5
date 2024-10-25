import 'package:amimobile5/pages/maison/compte_creat.dart';
import 'package:amimobile5/pages/maison/compte_id.dart';
import 'package:flutter/material.dart';
// import 'package:amimobile5/pages/maison/aide_connexion.dart';
// import 'package:amimobile5/pages/maison/politique_securite.dart';

class ComptePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
        title: Text('Compte'), // Le titre de la page dans l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connectez-vous pour accéder à votre compte', // Le titre principal au centre
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Espace entre le titre et le texte
            Text(
              'Inscrivez-vous si vous n\'avez pas de compte.',
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
                          //builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Couleur du bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('S\'identifier'),
                ),
                SizedBox(width: 20), // Espace entre les boutons
                ElevatedButton(
                  onPressed: () {
                    // Logique pour le deuxième bouton
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => creerPage()),
                      //MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Couleur du bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('Créer un compte'),
                ),
              ],
            ),
            SizedBox(height: 40), // Espace avant le bas de page
            // Ajout des phrases avec leurs icônes
            Align(
              alignment: Alignment.bottomLeft, // Alignement à gauche
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Navigation vers la page d'aide sur la connexion
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AideConnexionPage()),
                      // );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.history,
                            color:
                                Colors.black), // Icône pour la première phrase
                        SizedBox(width: 8), // Espace entre l'icône et le texte
                        Text(
                          'Mes commandes',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10), // Espace entre les phrases
                  GestureDetector(
                    onTap: () {
                      // Navigation vers la page de politique de sécurité
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PolitiqueSecuritePage()),
                      // );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.settings_applications,
                            color:
                                Colors.black), // Icône pour la deuxième phrase
                        SizedBox(width: 8), // Espace entre l'icône et le texte
                        Text(
                          'Parametres',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
