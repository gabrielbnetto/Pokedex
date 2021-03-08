import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokedexInfo/pokemonInfo.dart';
import 'package:hexcolor/hexcolor.dart';

class PokeDex extends StatefulWidget {
  PokeDex({Key key}) : super(key: key);

  @override
  _Pokedex createState() => _Pokedex();
}

class _Pokedex extends State<PokeDex> {
  List<Pokemon> pokemonList = [];
  int minPokes = 1;
  int maxPokes = 20;
  ScrollController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange && !_isLoading) {
      
      setState(() {
        minPokes = maxPokes+1;
        maxPokes += 20;
        _isLoading = true;
      });
      List<Pokemon> newPokes = await PokeAPI.getObjectList<Pokemon>(minPokes, maxPokes);
      setState(() {
        newPokes.forEach((e) => pokemonList.add(e));
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ff0000'),
        title: Text("PokeDex"),
        centerTitle: true
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: PokeAPI.getObjectList<Pokemon>(minPokes, maxPokes),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(pokemonList.length == 0){
              snapshot.data.forEach((e) => pokemonList.add(e));  
            }
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/pokedexBackground.png"),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      controller: _controller,
                      crossAxisCount: 2,
                      children: List.generate(
                        pokemonList.length, (index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: InkWell(
                              onTap: (){_sendToPokemonPage(pokemonList[index]);},
                              child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/backgroundTypes/${pokemonList[index].types[0].type.name}.png")
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child:Stack(
                                children: <Widget>[
                                  // Pokemon Name
                                  Container(
                                    margin: EdgeInsets.only(top: 8, left: 12),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      pokemonName(pokemonList[index].name), 
                                      style: TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    )
                                  ),

                                  //Pokemon Type
                                  Container(
                                    height: 20,
                                    margin: EdgeInsets.only(top: 32, left: 6),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: (pokemonList[index].types.length),
                                      itemBuilder: (BuildContext context, int i) {
                                        return Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top:4, left: 4),
                                          padding: EdgeInsets.only(left:4, right: 4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white.withOpacity(0.5),
                                          ),
                                          child: Text(
                                            pokemonList[index].types[i].type.name.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )
                                        );
                                      }
                                    )
                                  ),
                                  
                                  //Pokeball
                                  Opacity(
                                    opacity: 0.4,
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top:16),
                                      child: Image.asset("assets/pokeball.png", width: 95, height: 95)
                                    )
                                  ),

                                  //Pokemon Image
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top:16),
                                    child: Image.network(pokemonList[index].sprites.frontDefault, width: 100, height: 100)
                                  ),

                                  //Type Image
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: SvgPicture.asset(
                                      "assets/types/${pokemonList[index].types[0].type.name}.svg", 
                                      color: Colors.white
                                    )
                                  ),

                                  //Arrow
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12, right: 8),
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                                  )
                                ]
                              )
                            )
                          ));
                        }
                      )
                    ),
                  ),
                  (_isLoading)
                    ? Container(
                      height: 90,
                      child:Center(child:CircularProgressIndicator()), 
                    )
                    : Container()
                ]
              )
            );
          }else{
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/pokedexBackground.png"),
                )
              ),
              child: Center(
                child:CircularProgressIndicator()
              )
            );
          }
        }
      ),
       
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.menu_rounded, size: 30),
      ), 
    );
  }

  _sendToPokemonPage(Pokemon pokemon){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PokemonInfo(pokemon: pokemon))
    );
  }

  String pokemonName(String name) {
    if(name == 'nidoran-f' || name == 'nidoran-m'){
      return '${name[0].toUpperCase()}${name.substring(1, (name.length - 2))}';
    }else{
      return '${name[0].toUpperCase()}${name.substring(1)}';
    }
  }
}
