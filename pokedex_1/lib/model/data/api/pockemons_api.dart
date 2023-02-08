import 'package:dio/dio.dart';
import '../../class_Pockemons.dart';
import 'dart:convert';

class PokemonsAPI {
  final Dio dio = Dio();

  Future<List<Data>> getPokemons() async {
    try {
      var response =
          await dio.get("http://104.131.18.84/pokemon/?limit=50&page=0");
      return (response.data["data"] as List).map((json) {
        return Data.fromJson(json);
      }).toList();
    } catch (e) {
      print(e);
    }
    throw {print("erro ao obter dados")};
  }
}
