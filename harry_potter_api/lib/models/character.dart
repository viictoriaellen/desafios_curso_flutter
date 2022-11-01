import 'package:harry_potter_api/models/wand.dart';

class Character {
  String? name;
  List<String>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  double? yearOfBirth;
  bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<String>? alternateActors;
  bool? alive;
  String? image;

  Character(
      {this.name,
      this.alternateNames,
      this.species,
      this.gender,
      this.house,
      this.dateOfBirth,
      this.yearOfBirth,
      this.wizard,
      this.ancestry,
      this.eyeColour,
      this.hairColour,
      this.wand,
      this.patronus,
      this.hogwartsStudent,
      this.hogwartsStaff,
      this.actor,
      this.alternateActors,
      this.alive,
      this.image});

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['alternate_names'] != null) {
      alternateNames = <String>[];
      json['alternate_names'].forEach((name) => alternateNames!.add(name));
    }
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    //yearOfBirth = json['yearOfBirth'] is double ? json['yearOfBirth'] : null;
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = json['wand'] != null ? Wand.fromJson(json['wand']) : null;
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    if (json['alternate_actors'] != null) {
      alternateActors = <String>[];
      json['alternate_actors'].forEach((name) => alternateActors!.add(name));
    }
    alive = json['alive'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    if (this.alternateNames != null) {
      data['alternate_names'] = this.alternateNames!.map((v) => v).toList();
    }
    data['species'] = this.species;
    data['gender'] = this.gender;
    data['house'] = this.house;
    data['dateOfBirth'] = this.dateOfBirth;
    data['yearOfBirth'] = this.yearOfBirth;
    data['wizard'] = this.wizard;
    data['ancestry'] = this.ancestry;
    data['eyeColour'] = this.eyeColour;
    data['hairColour'] = this.hairColour;
    if (this.wand != null) {
      data['wand'] = this.wand!.toJson();
    }
    data['patronus'] = this.patronus;
    data['hogwartsStudent'] = this.hogwartsStudent;
    data['hogwartsStaff'] = this.hogwartsStaff;
    data['actor'] = this.actor;
    if (this.alternateActors != null) {
      data['alternate_actors'] = this.alternateActors!.map((v) => v).toList();
    }
    data['alive'] = this.alive;
    data['image'] = this.image;
    return data;
  }
}
