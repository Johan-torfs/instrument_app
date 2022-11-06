import './instrument.dart';

class Musician {
  final int id;
  final String name;
  final int yearOfBirth;
  final int yearOfDeath;
  final Instrument instrument;

  const Musician({
    required this.id,
    required this.name,
    required this.yearOfBirth,
    required this.yearOfDeath,
    required this.instrument,
  });

  factory Musician.fromJson(Map<String, dynamic> json) {
    return Musician(
      id: int.parse(json['id']),
      name: json['name'],
      yearOfBirth: json['yearOfBirth'],
      yearOfDeath: json['yearOfDeath'],
      instrument: Instrument.fromJson(json['instrument']),
    );
  }
}