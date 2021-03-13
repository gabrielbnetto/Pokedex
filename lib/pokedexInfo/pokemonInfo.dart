import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokeapi/model/evolution/evolution-trigger.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/pokedexInfo/StatsPokemon.dart';
import 'package:pokedex/pokedexInfo/aboutPokemon.dart';
import '../Utils/TypeColorUtils.dart';

class PokemonInfo extends StatefulWidget {
  final Pokemon pokemon;

  PokemonInfo({Key key, this.pokemon}) : super(key: key);

  @override
  _PokemonInfo createState() => _PokemonInfo();
}

class _PokemonInfo extends State<PokemonInfo> {
  TypeColorUtils color = new TypeColorUtils();
  int selectedTab = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ff0000'),
        title: Text('Pokemon Details'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                //Background Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.36,
                  decoration: BoxDecoration(
                    color: HexColor('#d4ebf2'),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/infoBackground.png"),
                    ),
                  ),
                ),

                //White Rounded Container
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.32),
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight:Radius.circular(20)
                    )
                  ),
                ),

                //Pokemon Shadow
                Center(
                  child:Container(
                    width: 300,
                    padding: EdgeInsets.only(top: 154),
                    child: Image.asset('assets/shadowPokemon.png'),
                  )
                ),

                //Pokemon Image
                Container(
                  height: (widget.pokemon.name != 'bulbasaur') 
                    ? MediaQuery.of(context).size.height * 0.38
                    : MediaQuery.of(context).size.height * 0.40,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(right:4),
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.pokemon.sprites.frontDefault),
                          fit: BoxFit.fill
                      ),
                    )
                  ),
                ),
              ],
            ),

            //Pokemon Name and Type Image
            Row(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset(
                    "assets/types/${widget.pokemon.types[0].type.name}.svg", 
                    color: color.typeColor(widget.pokemon.types[0].type.name)
                  )
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      pokemonName(),
                      style: TextStyle(color: color.typeColor(widget.pokemon.types[0].type.name), fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  )
                ),
                (widget.pokemon.types.length == 1)
                ? Container(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/types/${widget.pokemon.types[0].type.name}.svg", 
                    color: color.typeColor(widget.pokemon.types[0].type.name)
                  )
                )
                : Container(
                  child: SvgPicture.asset(
                    "assets/types/${widget.pokemon.types[1].type.name}.svg", 
                    color: color.typeColor(widget.pokemon.types[1].type.name)
                  )
                ),
              ]
            ),

            //Pokemon Type
            Container(
              height: 20,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: (widget.pokemon.types.length),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top:4, left: 4),
                    padding: EdgeInsets.only(left: 4,right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color.typeColor(widget.pokemon.types[index].type.name).withOpacity(0.5),
                    ),
                    child: Text(
                      widget.pokemon.types[index].type.name.toUpperCase(),
                      style: TextStyle(
                        color: color.typeColor(widget.pokemon.types[index].type.name),
                        fontWeight: FontWeight.bold
                      ),
                    )
                  );
                }
              )
            ),

            //Tab Menu
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () { setState(() {selectedTab = 0;}); },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: (selectedTab == 0)
                            ? BorderSide(width: 2.0, color: color.typeColor(widget.pokemon.types[0].type.name))
                            : BorderSide(color: Colors.white)
                        ),
                      ),
                      child: Text(
                        'About', 
                        style: (selectedTab == 0)
                        ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)
                        : TextStyle(fontSize: 16, color: Colors.grey)
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () { setState(() {selectedTab = 1;}); },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: (selectedTab == 1)
                            ? BorderSide(width: 2.0, color: color.typeColor(widget.pokemon.types[0].type.name))
                            : BorderSide(color: Colors.white)
                        ),
                      ),
                      child: Text(
                        'Base Stats',
                        style: (selectedTab == 1)
                        ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)
                        : TextStyle(fontSize: 16, color: Colors.grey)
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () { setState(() {selectedTab = 2;}); },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: (selectedTab == 2)
                            ? BorderSide(width: 2.0, color: color.typeColor(widget.pokemon.types[0].type.name))
                            : BorderSide(color: Colors.white)
                        ),
                      ),
                      child: Text(
                        'Evolution',
                        style: (selectedTab == 2)
                        ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)
                        : TextStyle(fontSize: 16, color: Colors.grey)
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () { setState(() {selectedTab = 3;}); },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: (selectedTab == 3)
                            ? BorderSide(width: 2.0, color: color.typeColor(widget.pokemon.types[0].type.name))
                            : BorderSide(color: Colors.white)
                        ),
                      ),
                      child: Text(
                        'Weakness',
                        style: (selectedTab == 3)
                        ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)
                        : TextStyle(fontSize: 16, color: Colors.grey)
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () { setState(() {selectedTab = 4;}); },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: (selectedTab == 4)
                            ? BorderSide(width: 2.0, color: color.typeColor(widget.pokemon.types[0].type.name))
                            : BorderSide(color: Colors.white)
                        ),
                      ),
                      child: Text(
                        'Moves',
                        style: (selectedTab == 4)
                        ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)
                        : TextStyle(fontSize: 16, color: Colors.grey)
                      )
                    )
                  )
                ]
              )
            ),

            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: buildPokemonInfo()
            )
          ],
        )
      )
    );
  }

  String pokemonName() {
    if(widget.pokemon.name == 'nidoran-f' || widget.pokemon.name == 'nidoran-m'){
      return '${widget.pokemon.name[0].toUpperCase()}${widget.pokemon.name.substring(1, (widget.pokemon.name.length - 2))}';
    }else{
      return '${widget.pokemon.name[0].toUpperCase()}${widget.pokemon.name.substring(1)}';
    }
  }

  buildPokemonInfo(){
    switch (selectedTab){
      case 0:
        return AboutPokemon(widget.pokemon.sprites, widget.pokemon.gameIndices, widget.pokemon.name);
      case 1:
        return StatsPokemon(widget.pokemon.stats, widget.pokemon.types, widget.pokemon.baseExperience);
    }
  }
}