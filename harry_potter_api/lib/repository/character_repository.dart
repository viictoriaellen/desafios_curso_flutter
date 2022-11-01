import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/character.dart';

class CharacterRepository {
  Future<List<Character>?> getCharacters() async {
    try {
      final characters = <Character>[];

      final response = await Dio().get(
          'https://hp-api.herokuapp.com/api/characters'); //usa a lib Dio para bater na api e pegar o payload

      List<dynamic> list = response.data;

      for (final Map<String, dynamic> item in list) {
        final character = Character.fromJson(item);
        characters.add(character);
      }

      return characters;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
