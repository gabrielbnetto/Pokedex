

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Utils/TypeColorUtils.dart';
import 'package:pokedex/Utils/TypeUtils.dart';

class PokemonType extends StatefulWidget {
  final String type;

  PokemonType(this.type, {Key key}) : super(key: key);

  @override
  _PokemonType createState() => _PokemonType();
}

class _PokemonType extends State<PokemonType> {
  TypeUtils types = new TypeUtils();
  TypeColorUtils typeColors = new TypeColorUtils();
  List weaknessTypes = [];
  List strengthTypes = [];

  @override
  void initState() {
    strengthTypes = types.typeStrength(widget.type);
    weaknessTypes = types.typeWeakness(widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text("Attacking Types:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: strengthTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: typeColors.typeColor(strengthTypes[index]["type"])),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Text(strengthTypes[index]["type"],
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                            ),
                            Text(
                              "x"+strengthTypes[index]["intensity"].toString(),
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                              ),
                              Container(
                                child: SvgPicture.asset(
                                  "assets/types/${strengthTypes[index]["type"].toLowerCase()}.svg", 
                                  color: Colors.white
                                )
                              ),
                          ]
                        )
                      );
                    }
                  )
                ]
              )
            )
          ),

          Card(
            elevation: 2,
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text("Defending Types:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: weaknessTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: typeColors.typeColor(weaknessTypes[index]["type"])),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Text(weaknessTypes[index]["type"],
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                            ),
                            Text(
                              "x"+weaknessTypes[index]["intensity"].toString(),
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                              ),
                              Container(
                                child: SvgPicture.asset(
                                  "assets/types/${weaknessTypes[index]["type"].toLowerCase()}.svg", 
                                  color: Colors.white
                                )
                              ),
                          ]
                        )
                      );
                    }
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}

    






  


  
