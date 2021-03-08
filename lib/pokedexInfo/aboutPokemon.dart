

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

class AboutPokemon extends StatefulWidget {
  final Pokemon pokemon;

  AboutPokemon(this.pokemon, {Key key}) : super(key: key);

  @override
  _AboutPokemon createState() => _AboutPokemon();
}

class _AboutPokemon extends State<AboutPokemon> {

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        //Shiny
        (widget.pokemon.sprites.frontShinyFemale != null || 
        widget.pokemon.sprites.backShinyFemale != null ||
        widget.pokemon.sprites.frontShiny != null ||
        widget.pokemon.sprites.backShiny != null) ?
        Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Pokemon Shiny Version', 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                )
              ),
              Row(
                mainAxisAlignment: (widget.pokemon.sprites.frontShinyFemale != null || widget.pokemon.sprites.backShinyFemale != null) ?
                 MainAxisAlignment.spaceAround : MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Male Version', 
                      style: TextStyle(fontSize: 16)
                    )
                  ),
                  (widget.pokemon.sprites.frontShinyFemale != null || widget.pokemon.sprites.backShinyFemale != null) ?
                  Container(
                    child: Text(
                      'Female Version', 
                      style: TextStyle(fontSize: 16)
                    )
                  ) : Container(),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.network(widget.pokemon.sprites.frontShiny)
                  ),
                  (widget.pokemon.sprites.backShiny != null) ?
                  Container(
                    child: Image.network(widget.pokemon.sprites.backShiny)
                  ) : Container(),
                  (widget.pokemon.sprites.frontShinyFemale != null) ?
                  Container(
                    child: Image.network(widget.pokemon.sprites.frontShinyFemale)
                  ) : Container(),
                  (widget.pokemon.sprites.backShinyFemale != null) ?
                  Container(
                    child: Image.network(widget.pokemon.sprites.backShinyFemale)
                  ) : Container()
                ]
              ),
            ]
          )
        ): Container,

        // Game Versions
        Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                child: Text(
                  'Pokemon Games List that ${widget.pokemon.name[0].toUpperCase()}${widget.pokemon.name.substring(1)} Appears', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: (widget.pokemon.gameIndices.length),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8, left: 8),
                        child: Image.asset(
                          'assets/gameList/${widget.pokemon.gameIndices[index].version.name}.jpg',
                          width: 200,
                          height: (widget.pokemon.gameIndices[index].version.name == "crystal") ? 150 : 100
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          pokemonGameName(widget.pokemon.gameIndices[index].version.name),
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      )
                    ]
                  );
                }
              ),
            ]
          )
        )
      ]
    );
  }

  String pokemonGameName(String name){
    if(name == "white-2" || name == "black-2"){
      return "Pokemon ${name[0].toUpperCase()}${name.substring(1, (widget.pokemon.name.length - 4))} 2";
    }else{
      return "Pokemon ${name[0].toUpperCase()}${name.substring(1)}";
    }
  }
}