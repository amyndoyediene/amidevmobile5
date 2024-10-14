import 'package:amimobile5/pages/acceuil2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1F5C), // Couleur d'arrière-plan bleu foncé
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100), // Pour espacer le haut
          // Image au centre
          Center(
            child: Container(
              width: 263,
              height: 262,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/amm.jpeg'), // Assurez-vous que votre image est dans le dossier assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacement sous l'image
          // Texte en dessous de l'image
          Text(
            'Bienvenue sur notre application',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(), // Remplir l'espace restant avant le bouton
          // Bouton "Get Started"
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ElevatedButton(
              onPressed: () {
                // Action quand on appuie sur le bouton
                // Navigation vers une nouvelle page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EcommercePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00CFFF), // Couleur du bouton
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Commencer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}