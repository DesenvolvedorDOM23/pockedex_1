import 'package:flutter/material.dart';
import 'package:pokedex_1/pages/listPockemons.dart';
import '../model/class_Pockemons.dart';
import 'dart:convert';

class DetailPockemons extends StatefulWidget {
  const DetailPockemons({super.key});

  @override
  State<DetailPockemons> createState() => _DetailPockemonsState();
}

class _DetailPockemonsState extends State<DetailPockemons> {
  @override
  Widget build(BuildContext context) {
    Data pokemon = ModalRoute.of(context)?.settings.arguments as Data;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            pokemon.name ?? '',
            style: TextStyle(fontSize: 22, fontFamily: 'RobotoMono-Regular'),
          ),
          centerTitle: true,
        ),
        body: _widigetPokemon(pokemon));
  }

  _widigetPokemon(pokemons) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.topRight, children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Image.network(
                pokemons.thumbnailImage ?? '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '#${pokemons.number ?? ''}',
                style: TextStyle(fontSize: 16),
              ),
            )
          ]),
          SizedBox(height: 15),
          Text(
            pokemons.description ?? '',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tipo",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${pokemons.type}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'RobotoMono',
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Fraquezas",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'RobotoMono-Italic',
                      fontWeight: FontWeight.bold),
                ),
                Text('${pokemons.weakness}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'RobotoMono-Regular')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
