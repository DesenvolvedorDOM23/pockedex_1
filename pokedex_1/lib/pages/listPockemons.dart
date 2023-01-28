import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../model/class_Pockemons.dart';

class ListPockemons extends StatefulWidget {
  ListPockemons({super.key});
  @override
  State<ListPockemons> createState() => _ListPockemonsState();
}

class _ListPockemonsState extends State<ListPockemons> {
  final loading = true;
  List<Data> pokemonsList = [];
  @override
  void initState() {
    _getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 65, 55),
        title: Text(
          "Pokedex",
          style: TextStyle(fontFamily: 'RobotoMono-Regular'),
        ),
        actions: <Widget>[
          Image.asset(
            'assets/images/icons8-pokeball-48.png',
            height: 45,
            width: 60,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: pokemonsList.length,
        itemBuilder: ((context, index) {
          Data pokemon = pokemonsList[index];
          return Card(
            shadowColor: Colors.grey[800],
            elevation: 4,
            child: ListTile(
              trailing: Text('#${pokemon.number}'),
              leading: Image.network(pokemon.thumbnailImage ?? ""),
              title: Text(
                pokemon.name ?? "",
                style: TextStyle(fontFamily: 'RobotoMono-Regular'),
              ),
              onTap: (() {
                Navigator.of(context).pushNamed("/detail", arguments: pokemon);
              }),
            ),
          );
        }),
      ),
    );
  }

  void _getPokemons() async {
    try {
      var response =
          await Dio().get("http://104.131.18.84/pokemon/?limit=50&page=0");
      setState(() {
        if (response.statusCode == 200) {
          pokemonsList = (response.data["data"] as List).map((json) {
            return Data.fromJson(json);
          }).toList();
        } else {
          print("falha oa obter pokemons");
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
