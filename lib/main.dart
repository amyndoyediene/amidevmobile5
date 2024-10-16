import 'package:amimobile5/pages/acceuil1.dart';
import 'package:amimobile5/pages/acceuil2.dart';
import 'package:amimobile5/pages/search.dart';
import 'package:amimobile5/pages/product.dart';
import 'package:amimobile5/pages/home/home.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
        '/search': (context) => SearchPage(),
        '/product': (context) => HomepPage(),
        '/home': (context) => HomePage1(),
      },
    );
  }
}
