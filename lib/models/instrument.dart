import 'dart:convert';

import './piece.dart';
import './musician.dart';

class Instrument {
  final int id;
  final String name;
  final String period;
  final String description;
  final String collection;
  final List<Musician> musicians;
  final List<Piece> pieces;

  const Instrument({
    required this.id,
    required this.name,
    required this.period,
    required this.description,
    required this.collection,
    required this.musicians,
    required this.pieces,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    List<Musician> jsonMusicians = <Musician>[];
    if (json['musicians'] != null) json['musicians'].forEach((musician) => jsonMusicians.add(Musician.fromJson(musician)));

    List<Piece> jsonPieces = <Piece>[];
    if (json['pieces'] != null) json['pieces'].forEach((piece) => jsonPieces.add(Piece.fromJson(piece)));

    return Instrument(
      id: int.parse(json['id']),
      name: utf8.decode(latin1.encode(json['name'])),
      period: utf8.decode(latin1.encode(json['period'])),
      description: utf8.decode(latin1.encode(json['description'])),
      collection: utf8.decode(latin1.encode(json['collection'])),
      musicians: jsonMusicians,
      pieces: jsonPieces,
    );
  }
}