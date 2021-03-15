

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/getPokemonService.dart';

class PokemonEvolutions extends StatefulWidget {
  final String pokemonSprite;
  final String pokemonName;
  final int pokemonId;

  PokemonEvolutions(this.pokemonId, this.pokemonSprite, this.pokemonName, {Key key}) : super(key: key);

  @override
  _PokemonEvolutions createState() => _PokemonEvolutions();
}

class _PokemonEvolutions extends State<PokemonEvolutions> {
  GetOnePokemonService getPokemon = new GetOnePokemonService();

  Future<List<Pokemon>> getPokemonEvolutions() async {
    print(widget.pokemonId);
    var evolutions = await PokeAPI.getObject<EvolutionChain>(widget.pokemonId);
    if(evolutions.chain.evolvesTo[0].evolvesTo.length == 0){
      Pokemon evolution = await getPokemon.getPokemon(evolutions.chain.evolvesTo[0].species.name); 
      return [evolution];
    }else{
      Pokemon firstEvolution = await getPokemon.getPokemon(evolutions.chain.evolvesTo[0].species.name); 
      Pokemon secondEvolution = await getPokemon.getPokemon(evolutions.chain.evolvesTo[0].evolvesTo[0].species.name); 
      return [firstEvolution, secondEvolution];
    }
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<Pokemon>>(
      future: getPokemonEvolutions(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Container(
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Divider(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.network(widget.pokemonSprite)
                      ),
                      Container(child: Icon(Icons.double_arrow)),
                      Container(
                        child: Image.network(snapshot.data[0].sprites.frontDefault)
                      ),
                    ]
                  )
                ),
                Divider(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.network(snapshot.data[0].sprites.frontDefault)
                      ),
                      Container(child: Icon(Icons.double_arrow)),
                      Container(
                        child: Image.network(snapshot.data[1].sprites.frontDefault)
                      ),
                    ]
                  )
                ),
              ]
            )
          );
        }else{
          return Container(
            // height: 90,
            margin: EdgeInsets.only(top: 18),
            child:Center(child:CircularProgressIndicator()), 
          );
        }
      }
    );
  }
}