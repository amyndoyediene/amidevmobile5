import 'package:amimobile5/admin_wel.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InscriadminPage(),
    );
  }
}

class InscriadminPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriadminPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        title: Text('Page de connexion adminstrateur', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Champ Nom
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nom',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
              ),
              SizedBox(height: 20),

              // Champ Mot de passe
              TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 20),

              // Bouton Se connecter
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminwelPage()),
                  );
                },
                child: Text(
                  'Se connecter',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EcommerceHomePage {}