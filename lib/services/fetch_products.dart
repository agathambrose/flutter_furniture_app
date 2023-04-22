import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Product.dart';

Future<List<Product>> fetchProducts() async {
  final apiUrl =
      Uri.parse('https://5f210aa9daa42f001666535e.mockapi.io/api/products');
  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response,
    // then parse the JSON.
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    // It returns a list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
