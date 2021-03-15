
import 'dart:convert';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:http/http.dart' as Http;

class GetOnePokemonService {
  Future<Pokemon> getPokemon(String pokemon) async {
    try{
      String url = "https://pokeapi.co/api/v2/pokemon/$pokemon";
      var response = await Http.get(url);
      Map listMap = json.decode(response.body);
      return Pokemon.fromJson(listMap);
    }catch(e){
      throw e;
    }
  }
}