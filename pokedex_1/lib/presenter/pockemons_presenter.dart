import 'package:flutter/cupertino.dart';
import '../model/data/api/pockemons_api.dart';
import 'entities/pockemonsEntity.dart';

class PokemonsPresent extends ChangeNotifier {
  final PokemonsAPI api;
  List<PokemonEntity> pokemon = [];

  PokemonsPresent(this.api);

  Future<List<PokemonEntity>> getPoke() async {
    final resultado = await api.getPokemons();
    if (resultado == null) {
      return [];
    }
    return resultado
        .map((e) => PokemonEntity(
            name: e.name,
            number: e.number,
            thumbnailImage: e.thumbnailImage,
            description: e.description,
            type: e.type,
            weakness: e.weakness))
        .toList();
  }

  void getPockemons() async {
    List<PokemonEntity> pockemons = await getPoke();
    pokemon = pockemons;
    notifyListeners();
  }
}
