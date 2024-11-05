
import 'package:amimobile5/pages/acceuil1.dart';
import 'package:amimobile5/pages/acceuil2.dart';
import 'package:amimobile5/pages/maison/compte.dart';
import 'package:flutter/material.dart';


//import 'package:firebase_core/firebase_core.dart';
//import 'package:amimobile5/pages/maison/notifications_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //NotificationService.initialize(); // Initialisation des notifications
   WidgetsFlutterBinding.ensureInitialized(
    // options: FirebaseOptions(
    //   apiKey: "VOTRE_API_KEY",
    //   authDomain: "VOTRE_AUTH_DOMAIN",
    //   projectId: "VOTRE_PROJECT_ID",
    //   storageBucket: "VOTRE_STORAGE_BUCKET",
    //   messagingSenderId: "VOTRE_MESSAGING_SENDER_ID",
    //   appId: "VOTRE_APP_ID",
    // ),
   );
    // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/acceuil2': (context) => EcommercePage(),
        // '/search': (context) => SearchPage(),
        '/account': (context) => ComptePage(),
        // '/login': (context) => LoginScreen(),
        // '/register': (context) => SignUp(),
      },
    );
  }
}
