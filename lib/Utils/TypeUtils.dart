class TypeUtils {
  typeWeakness(String type){
    switch (type){
      case 'normal':
        return [
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Ghost", "intensity": 0}
        ];
      case 'fire':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 2.0},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Ice", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
          {"type": "Fairy", "intensity": 0.5}
        ];
      case 'water':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 0.5},
          {"type": "Grass", "intensity": 2.0},
          {"type": "Electric", "intensity": 2.0},
          {"type": "Ice", "intensity": 0.5},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'grass':
        return [
          {"type": "Fire", "intensity": 2.0},
          {"type": "Water", "intensity": 0.5},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Electric", "intensity": 0.5},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Poison", "intensity": 2.0},
          {"type": "Ground", "intensity": 0.5},
          {"type": "Flying", "intensity": 2.0},
          {"type": "Bug", "intensity": 2.0},
        ];
      case 'electric':
        return [
          {"type": "Electric", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Flying", "intensity": 0.5},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'ice':
        return [
          {"type": "Fire", "intensity": 2.0},
          {"type": "Ice", "intensity": 0.5},
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Steel", "intensity": 2.0},
        ];
      case 'fighting':
        return [
          {"type": "Flying", "intensity": 2.0},
          {"type": "Psychic", "intensity": 2.0},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 0.5},
          {"type": "Dark", "intensity": 0.5},
          {"type": "Fairy", "intensity": 2.0},
        ];
      case 'poison':
        return [
          {"type": "Grass", "intensity": 0.5},
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Psychic", "intensity": 2.0},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Fairy", "intensity": 0.5},
        ];
      case 'ground':
        return [
          {"type": "Water", "intensity": 2.0},
          {"type": "Grass", "intensity": 2.0},
          {"type": "Electric", "intensity": 0},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Rock", "intensity": 0.5},
        ];
      case 'flying':
        return [
          {"type": "Grass", "intensity": 0.5},
          {"type": "Electric", "intensity": 2.0},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Ground", "intensity": 0},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 2.0},
        ];
      case 'psychic':
        return [
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Psychic", "intensity": 0.5},
          {"type": "Bug", "intensity": 2.0},
          {"type": "Ghost", "intensity": 2.0},
          {"type": "Dark", "intensity": 2.0},
        ];
      case 'bug':
        return [
          {"type": "Fire", "intensity": 2.0},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Ground", "intensity": 0.5},
          {"type": "Flying", "intensity": 2.0},
          {"type": "Rock", "intensity": 2.0},
        ];
      case 'rock':
        return [
          {"type": "Normal", "intensity": 0.5},
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 2.0},
          {"type": "Grass", "intensity": 2.0},
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Flying", "intensity": 0.5},
          {"type": "Steel", "intensity": 2.0},
        ];
      case 'ghost':
        return [
          {"type": "Normal", "intensity": 0},
          {"type": "Fighting", "intensity": 0},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Ghost", "intensity": 2.0},
          {"type": "Dark", "intensity": 2.0},
        ];
      case 'dragon':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 0.5},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Electric", "intensity": 0.5},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Dragon", "intensity": 2.0},
          {"type": "Fairy", "intensity": 2.0},
        ];
      case 'dark':
        return [
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Psychic", "intensity": 0},
          {"type": "Bug", "intensity": 2.0},
          {"type": "Ghost", "intensity": 0.5},
          {"type": "Dark", "intensity": 0.5},
          {"type": "Fairy", "intensity": 2.0},
        ];
      case 'steel':
        return [
          {"type": "Normal", "intensity": 0.5},
          {"type": "Fire", "intensity": 2.0},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Ice", "intensity": 0.5},
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Poison", "intensity": 0},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Flyign", "intensity": 0.5},
          {"type": "Psychic", "intensity": 0.5},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 0.5},
          {"type": "Dragon", "intensity": 0.5},
          {"type": "Steel", "intensity": 0.5},
          {"type": "Fairy", "intensity": 0.5},
        ];
      case 'fairy':
        return [
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Poison", "intensity": 2.0},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Dragon ", "intensity": 0},
          {"type": "Dark", "intensity": 0.5},
          {"type": "Steel", "intensity": 2.0},
        ];
    }
  }

  typeStrength(String type){
    switch (type){
      case 'normal':
        return [
          {"type": "Rock", "intensity": 0.5},
          {"type": "Ghost", "intensity": 0},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'fire':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 0.5},
          {"type": "Grass", "intensity": 2.0},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Bug", "intensity": 2.0},
          {"type": "Rock", "intensity": 0.5},
          {"type": "Dragon", "intensity": 0.5},
          {"type": "Steel", "intensity": 2.0},
        ];
      case 'water':
        return [
          {"type": "Fire", "intensity": 2.0},
          {"type": "Water", "intensity": 0.5},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Dragon", "intensity": 0.5},
        ];
      case 'grass':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 2.0},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Flying", "intensity": 0.5},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Dragon", "intensity": 0.5},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'electric':
        return [
          {"type": "Water", "intensity": 2.0},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Electric", "intensity": 0.5},
          {"type": "Ground", "intensity": 0},
          {"type": "Flying", "intensity": 2.0},
          {"type": "Dragon", "intensity": 0.5},
        ];
      case 'ice':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 0.5},
          {"type": "Grass", "intensity": 2.0},
          {"type": "Ice", "intensity": 0.5},
          {"type": "Ground", "intensity": 2.0},
          {"type": "Flying", "intensity": 2.0},
          {"type": "Dragon", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'fighting':
        return [
          {"type": "Normal", "intensity": 2.0},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Flying", "intensity": 0.5},
          {"type": "Psychic", "intensity": 0.5},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Ghost", "intensity": 0},
          {"type": "Dark", "intensity": 2.0},
          {"type": "Steel", "intensity": 2.0},
          {"type": "Fairy", "intensity": 0.5},
        ];
      case 'poison':
        return [
          {"type": "Grass", "intensity": 2.0},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Ground", "intensity": 0.5},
          {"type": "Rock", "intensity": 0.5},
          {"type": "Ghost", "intensity": 0.5},
          {"type": "Steel", "intensity": 0},
          {"type": "Fairy", "intensity": 2.0},
        ];
      case 'ground':
        return [
          {"type": "Fire", "intensity": 2.0},
          {"type": "Grass", "intensity": 0.5},
          {"type": "Electric", "intensity": 2.0},
          {"type": "Poison", "intensity": 2.0},
          {"type": "Flying", "intensity": 0},
          {"type": "Bug", "intensity": 0.5},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Steel", "intensity": 2.0},
        ];
      case 'flying':
        return [
          {"type": "Grass", "intensity": 2.0},
          {"type": "Electric", "intensity": 0.5},
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Bug", "intensity": 2.0},
          {"type": "Rock", "intensity": 0.5},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'psychic':
        return [
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Poison", "intensity": 2.0},
          {"type": "Psychic", "intensity": 0.5},
          {"type": "Dark", "intensity": 0},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'bug':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Grass", "intensity": 2.0},
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Flying", "intensity": 0.5},
          {"type": "Psychic", "intensity": 2.0},
          {"type": "Ghost", "intensity": 0.5},
          {"type": "Dark", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
          {"type": "Fairy", "intensity": 0.5},
        ];
      case 'rock':
        return [
          {"type": "Fire", "intensity": 2.0},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Ground", "intensity": 0.5},
          {"type": "Flying", "intensity": 2.0},
          {"type": "Bug", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
        ];
      case 'ghost':
        return [
          {"type": "Normal", "intensity": 0.0},
          {"type": "Psychic", "intensity": 2.0},
          {"type": "Ghost", "intensity": 2.0},
          {"type": "Dark", "intensity": 0.5},
        ];
      case 'dragon':
        return [
          {"type": "Dragon", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
          {"type": "Fairy", "intensity": 0},
        ];
      case 'dark':
        return [
          {"type": "Fighting", "intensity": 0.5},
          {"type": "Psychic", "intensity": 2.0},
          {"type": "Ghost", "intensity": 2.0},
          {"type": "Dark", "intensity": 0.5},
          {"type": "Fairy", "intensity": 0.5},
        ];
      case 'steel':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Water", "intensity": 0.5},
          {"type": "Electric", "intensity": 0.5},
          {"type": "Ice", "intensity": 2.0},
          {"type": "Rock", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
          {"type": "Fairy", "intensity": 2.0},
        ];
      case 'fairy':
        return [
          {"type": "Fire", "intensity": 0.5},
          {"type": "Fighting", "intensity": 2.0},
          {"type": "Poison", "intensity": 0.5},
          {"type": "Dragon ", "intensity": 2.0},
          {"type": "Dark", "intensity": 2.0},
          {"type": "Steel", "intensity": 0.5},
        ];
    }
  }
}