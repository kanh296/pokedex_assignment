import 'package:flutter/material.dart';
import 'pokemon_list.dart';

void main() {
  runApp(MaterialApp(
    title: 'Pokedex',
    initialRoute: '/',
    routes: {
      '/': (context) => const PokemonList(),
    },
  ));
}
