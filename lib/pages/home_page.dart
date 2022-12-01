import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  // Uri
  //Url
  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGo-pokedex/master/pokedex.json");

    http.Response response = await http.get(_uri);
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Pokedex",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.35,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 126, 227, 234),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -22,
                            right: -25,
                            child: Image.asset(
                              "assets/images/pokeball.png",
                              height: 120.0,
                              color: Colors.white.withOpacity(0.27),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Bulbasaur",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.network(
                              "http://www.serebii.net/pokemongo/pokemon/001.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
