import './part.dart';
import 'dart:convert';

class Piece {
  final String id;
  final String name;
  final String period;
  final String composer;
  final List<Part> parts;

  const Piece({
    required this.id,
    required this.name,
    required this.period,
    required this.composer,
    required this.parts,
  });

factory Piece.fromJson(Map<String, dynamic> json) {
    List<Part> jsonParts = <Part>[];
    json['parts'].forEach((part) => jsonParts.add(Part.fromJson(part)));
    return Piece(
      id: json['id'],
      name: utf8.decode(latin1.encode(json['name'])),
      period: utf8.decode(latin1.encode(json['period'])),
      composer: utf8.decode(latin1.encode(json['composer'])),
      parts: jsonParts,
    );
  }
}