import 'package:flutter/material.dart';

import '../models/character.dart';
import 'views/charactes_list_item.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({super.key, required this.characters});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Potter World'),
        backgroundColor: const Color(0xFF9b111e),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black87,
        child: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharactersListItem(
                character: characters[index],
              );
            }),
      ),
    );
  }
}
