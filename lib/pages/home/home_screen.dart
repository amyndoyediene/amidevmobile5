import 'dart:convert';
import 'package:amimobile5/pages/product.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List> fetchProducts() async {
  final String response = await rootBundle.loadString('assets/products.json');
  final List<dynamic> data = json.decode(response);

  return data.map((product) => Product.fromJson(product)).toList();
}
