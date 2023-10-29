# pokedex_basic

Pokedex_basic is a Flutter application that has basic features of Pokemon Pokedex with two screens.

## Features

- View a list of Pokémon names on the home screen.
- Select a Pokémon from the list to view its details and an image on a separate screen.
- See the Pokémon's name, height (in centimeters), weight (in kilograms), and an image.

## API
https://pokeapi.co/api/v2/pokemon/?limit=10

## About the code

The Pokémon Pokedex app is structured into three primary Dart files:

### `main.dart`

- Entry point of the application.
- Defines the `MaterialApp` widget, which is the root of the app.
- Sets up routes for navigating between screens.

### `pokemon_list.dart`

- Contains the `PokemonList` widget, representing the home screen.
- Fetches and displays a list of Pokémon names from the PokeAPI using 'http' package
- Utilizes the `ListView.builder` widget for scrolling through the list.
- Uses a `GestureDetector` to make Pokémon names tappable, enabling navigation to the `PokemonDetail` screen.

### `pokemon_detail.dart`

- Houses the `PokemonDetail` widget, representing the detail screen for a selected Pokémon.
- Fetches and displays details, including an image, for the selected Pokémon from the PokeAPI
- Utilizes an `AppBar` for showing the selected Pokemon's name with a back button.
- Displays an image of the Pokémon along with its height, and weight.
