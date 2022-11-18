import './instrument.dart';
import 'dart:convert';

class Musician {
  final int id;
  final String name;
  final int yearOfBirth;
  final int? yearOfDeath;
  final Instrument? instrument;

  const Musician({
    required this.id,
    required this.name,
    required this.yearOfBirth,
    required this.yearOfDeath,
    this.instrument,
  });

  factory Musician.fromJson(Map<String, dynamic> json) {
    return Musician(
      id: int.parse(json['id']),
      name: utf8.decode(latin1.encode(json['name'])),
      yearOfBirth: json['yearOfBirth'],
      yearOfDeath: json['yearOfDeath'],
      instrument: json['instrument'] != null ? Instrument.fromJson(json['instrument']) : null,
    );
  }
}