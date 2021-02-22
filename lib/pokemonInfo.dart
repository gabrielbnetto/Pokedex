import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokeapi/model/evolution/evolution-trigger.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

class PokemonInfo extends StatefulWidget {
  final Pokemon pokemon;

  PokemonInfo({Key key, this.pokemon}) : super(key: key);

  @override
  _PokemonInfo createState() => _PokemonInfo();
}

class _PokemonInfo extends State<PokemonInfo> {

  void teste() async{
    // List<EvolutionChain> response = await PokeAPI.getObjectList<EvolutionChain>(1, 1);
    // response.forEach((element) { 
    //   print('veio');
    //   print(element);
    // });
    EvolutionChain response = await PokeAPI.getObject<EvolutionChain>(1);
    print(response.chain.evolvesTo[0].species);
    print(response.chain.evolvesTo[0].evolvesTo[0].species);
    // response.forEach((element) {print(element.chain.evolvesTo[0].species); });
  }

  @override
  Widget build(BuildContext context) {
    teste();
    print((widget.pokemon.types.length + 1));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ff0000'),
        title: Text('Pokemon Details'),
        centerTitle: true
      ),
      body: Container(
        color: Colors.white,
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
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight:Radius.circular(20)
                    )
                  ),
                ),

                //Pokemon Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.38,
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
            //Pokemon Name
            Container(
              margin: EdgeInsets.only(left:8),
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
            //       Text(
            //         '${widget.pokemon.name[0].toUpperCase()}${widget.pokemon.name.substring(1)}',
            //         style: TextStyle(color: Colors.blueGrey, fontSize: 26, fontWeight: FontWeight.bold),
            //       ),

                    Expanded(
                      child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: (widget.pokemon.types.length + 1),
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          margin: EdgeInsets.only(top:4),
                          padding: EdgeInsets.only(left: 4,right: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: Text(
                            widget.pokemon.types[i - 1].type.name.toUpperCase(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        );
                      }
                    )
                    )
                ]
              )
            )
          ],
        )
      )
    );
  }
}