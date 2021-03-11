
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TypeColorUtils {
  typeColor(String type){
    switch (type){
      case 'normal':
        return Colors.grey;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow[700];
      case 'ice':
        return HexColor('#41f4fa');
      case 'fighting':
        return HexColor('#7d1f13');
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.brown;
      case 'flying':
        return Colors.lightBlueAccent;
      case 'psychic':
        return Colors.pinkAccent;
      case 'bug':
        return HexColor('#298f1a');
      case 'rock':
        return HexColor('#42382c');
      case 'ghost':
        return HexColor('#523c73');
      case 'dragon':
        return Colors.blueAccent;
      case 'dark':
        return HexColor('#060a24');
      case 'steel':
        return HexColor('#535254');
      case 'fairy':
        return Colors.pinkAccent;
    }
  }
}