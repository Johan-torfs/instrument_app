import 'dart:convert';

class Instrument {
  final int id;
  final String name;
  final String period;
  final String description;
  final String collection;

  const Instrument({
    required this.id,
    required this.name,
    required this.period,
    required this.description,
    required this.collection,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: int.parse(json['id']),
      name: utf8.decode(latin1.encode(json['name'])),
      period: utf8.decode(latin1.encode(json['period'])),
      description: utf8.decode(latin1.encode(json['description'])),
      collection: utf8.decode(latin1.encode(json['collection'])),
    );
  }
}