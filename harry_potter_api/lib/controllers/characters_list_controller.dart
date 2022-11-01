import 'package:flutter/material.dart';
import 'package:harry_potter_api/models/character.dart';
import 'package:harry_potter_api/pages/loading_page.dart';
import 'package:harry_potter_api/repository/character_repository.dart';

import '../pages/characters_list_page.dart';

class CharactersListController extends StatelessWidget {
  const CharactersListController({super.key, required this.repository});

  final CharacterRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>?>(
        future: repository.getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CharactersListPage(
              characters: snapshot.data!,
            );
          }
          return const LoadingPage();
        });
  }
}
