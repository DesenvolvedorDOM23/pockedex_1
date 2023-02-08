import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../presenter/entities/pockemonsEntity.dart';
import 'package:dio/dio.dart';
import '../../presenter/pockemons_presenter.dart';

class ListPockemons extends StatefulWidget {
  ListPockemons({super.key});
  @override
  State<ListPockemons> createState() => _ListPockemonsState();
}

class _ListPockemonsState extends State<ListPockemons> {
  late PokemonEntity pockemons;
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 100),
      context.read<PokemonsPresent>().getPockemons,
    );

    super.initState();
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
        body: Consumer<PokemonsPresent>(
          builder: (context, presenter, child) {
            return ListView.builder(
                itemCount: presenter.pokemon.length,
                itemBuilder: (context, index) {
                  pockemons = presenter.pokemon[index];
                  return Card(
                    shadowColor: Colors.grey[800],
                    elevation: 4,
                    child: ListTile(
                      trailing: Text('#${pockemons.number}'),
                      leading: Image.network(pockemons.thumbnailImage ?? ""),
                      title: Text(
                        pockemons.name ?? "",
                        style: TextStyle(fontFamily: 'RobotoMono-Regular'),
                      ),
                      onTap: (() {
                        Navigator.of(context)
                            .pushNamed("/detail", arguments: pockemons);
                      }),
                    ),
                  );
                });
          },
        ));
  }
}
