

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

class AboutPokemon extends StatefulWidget {
  final Sprites sprites;
  final List<GameIndices> games;
  final String name;

  AboutPokemon(this.sprites, this.games, this.name, {Key key}) : super(key: key);

  @override
  _AboutPokemon createState() => _AboutPokemon();
}

class _AboutPokemon extends State<AboutPokemon> {

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          //Shiny
          (widget.sprites.frontShinyFemale != null || 
          widget.sprites.backShinyFemale != null ||
          widget.sprites.frontShiny != null ||
          widget.sprites.backShiny != null) ?
          Card(
            elevation: 2,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Pokemon Shiny Version', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )
                ),
                Row(
                  mainAxisAlignment: (widget.sprites.frontShinyFemale != null || widget.sprites.backShinyFemale != null) ?
                  MainAxisAlignment.spaceAround : MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Male Version', 
                        style: TextStyle(fontSize: 16)
                      )
                    ),
                    (widget.sprites.frontShinyFemale != null || widget.sprites.backShinyFemale != null) ?
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
                      child: Image.network(widget.sprites.frontShiny)
                    ),
                    (widget.sprites.backShiny != null) ?
                    Container(
                      child: Image.network(widget.sprites.backShiny)
                    ) : Container(),
                    (widget.sprites.frontShinyFemale != null) ?
                    Container(
                      child: Image.network(widget.sprites.frontShinyFemale)
                    ) : Container(),
                    (widget.sprites.backShinyFemale != null) ?
                    Container(
                      child: Image.network(widget.sprites.backShinyFemale)
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                  child: Text(
                    'Pokemon Games List that ${widget.name[0].toUpperCase()}${widget.name.substring(1)} Appears', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: (widget.games.length),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8, left: 8),
                          child: Image.asset(
                            'assets/gameList/${widget.games[index].version.name}.jpg',
                            width: 200,
                            height: (widget.games[index].version.name == "crystal") ? 150 : 100
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            pokemonGameName(widget.games[index].version.name),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        )
                      ]
                    );
                  }
                ),
                Container(
                  margin: EdgeInsets.only(top: 14, bottom: 14),
                  child: Text(
                    '*Not considering Pokemon Games after Black 2 and White 2 (2012)*', 
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ),
              ]
            )
          )
        ]
      )
    );
  }

  String pokemonGameName(String name){
    if(name == "white-2" || name == "black-2"){
      return "Pokemon ${name[0].toUpperCase()}${name.substring(1, (name.length - 4))} 2";
    }else if(name == "leafgreen"){
      return "Pokemon LeafGreen";
    }else if(name == "firered"){
      return "Pokemon FireRed";
    }else if(name == "heartgold"){
      return "Pokemon HeartGold";
    }else if(name == "soulsilver"){
      return "Pokemon SoulSilver";
    }else{
      return "Pokemon ${name[0].toUpperCase()}${name.substring(1)}";
    }
  }
}