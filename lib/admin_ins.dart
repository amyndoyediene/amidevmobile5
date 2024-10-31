import 'package:amimobile5/admin_wel.dart';
import 'package:flutter/material.dart';

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
  String? _name, _password;

  // Fonction de validation de connexion
  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_name == "amidiene" && _password == "1234") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminwelPage()),
        );
      } else {
        // Affichage d'un message d'erreur si les identifiants sont incorrects
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Nom d'utilisateur ou mot de passe incorrect"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Couleur d'arrière-plan rose
      appBar: AppBar(
        title: Text('Page de connexion administrateur', style: TextStyle(color: Colors.white)),
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
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 20),

              // Bouton Se connecter
              TextButton(
                onPressed: _validateAndLogin,
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
