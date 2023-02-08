import 'package:flutter/material.dart';
import 'model/data/api/pockemons_api.dart';
import 'view/pages/detailPockemons.dart';
import 'view/pages/listPockemons.dart';
import 'presenter/pockemons_presenter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PokemonsAPI()),
        ChangeNotifierProvider(
            create: (context) => PokemonsPresent(context.read()))
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        routes: {
          '/': (context) => ListPockemons(),
          '/detail': ((context) => DetailPockemons())
        },
      ),
    );
  }
}
