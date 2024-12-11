import 'dart:convert';

class Result {
  String? name;
  String? height;
  String? mass;
  String? hairColor;
  String? skinColor;
  String? eyeColor;
  String? birthYear;
  String? gender;
  String? homeworld;
  List<String>? films;
  List<dynamic>? species;
  List<String>? vehicles;
  List<String>? starships;
  DateTime? created;
  DateTime? edited;
  String? url;

  Result({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        name: data['name'] as String?,
        height: data['height'] as String?,
        mass: data['mass'] as String?,
        hairColor: data['hair_color'] as String?,
        skinColor: data['skin_color'] as String?,
        eyeColor: data['eye_color'] as String?,
        birthYear: data['birth_year'] as String?,
        gender: data['gender'] as String?,
        homeworld: data['homeworld'] as String?,
        films: data['films'] as List<String>?,
        species: data['species'] as List<dynamic>?,
        vehicles: data['vehicles'] as List<String>?,
        starships: data['starships'] as List<String>?,
        created: data['created'] == null
            ? null
            : DateTime.parse(data['created'] as String),
        edited: data['edited'] == null
            ? null
            : DateTime.parse(data['edited'] as String),
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'height': height,
        'mass': mass,
        'hair_color': hairColor,
        'skin_color': skinColor,
        'eye_color': eyeColor,
        'birth_year': birthYear,
        'gender': gender,
        'homeworld': homeworld,
        'films': films,
        'species': species,
        'vehicles': vehicles,
        'starships': starships,
        'created': created?.toIso8601String(),
        'edited': edited?.toIso8601String(),
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());
}
