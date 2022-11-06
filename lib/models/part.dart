import './instrument.dart';

class Part {
  final String instrument;
  final String name;
  final Instrument instrumentObj;

  const Part({
    required this.instrument,
    required this.name,
    required this.instrumentObj,
  });

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      instrument: json['instrument'],
      name: json['name'],
      instrumentObj: Instrument.fromJson(json['instrumentObj']),
    );
  }
}