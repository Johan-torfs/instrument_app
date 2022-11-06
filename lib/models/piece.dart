import './part.dart';

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
    return Piece(
      id: json['id'],
      name: json['name'],
      period: json['period'],
      composer: json['composer'],
      parts: json['parts'].map((part) => (Part.fromJson(part))),
    );
  }
}