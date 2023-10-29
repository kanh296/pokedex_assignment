import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonDetail extends StatefulWidget {
  final String name;

  const PokemonDetail({super.key, required this.name});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  Map<String, dynamic> pokemonData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.name}/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        pokemonData = data;
      });
    } else {
      throw Exception('Failed to load Pokemon data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = pokemonData.containsKey('sprites') ? pokemonData['sprites']['other']['official-artwork']['front_default'] : '';
    final height = pokemonData.containsKey('height') ? '${pokemonData['height'] * 10} cm' : '';
    final weight = pokemonData.containsKey('weight') ? (pokemonData['weight'] / 10).toStringAsFixed(1) + ' kg' : '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text ((widget.name),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold
          ),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                height: 350,
                width: 3500,
              ),
            Text('Height: $height',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),
            ),
            Text('Weight: $weight',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
