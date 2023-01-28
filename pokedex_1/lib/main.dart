import 'package:flutter/material.dart';
import 'model/class_Pockemons.dart';
import 'pages/detailPockemons.dart';
import 'pages/listPockemons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/': (context) => ListPockemons(),
        '/detail': ((context) => DetailPockemons())
      },
    );
  }
}
