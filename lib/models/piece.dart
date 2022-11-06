import './part.dart';
import './review.dart';
import 'dart:convert';

class Piece {
  final String id;
  final String name;
  final String period;
  final String composer;
  final List<Part> parts;
  final List<Review> reviews;

  const Piece({
    required this.id,
    required this.name,
    required this.period,
    required this.composer,
    required this.parts,
    required this.reviews,
  });

factory Piece.fromJson(Map<String, dynamic> json) {
    List<Part> jsonParts = <Part>[];
    if (json['parts'] != null) json['parts'].forEach((part) => jsonParts.add(Part.fromJson(part)));

    List<Review> jsonReviews = <Review>[];
    if (json['reviews'] != null) json['reviews'].forEach((review) => jsonReviews.add(Review.fromJson(review)));

    return Piece(
      id: json['id'],
      name: utf8.decode(latin1.encode(json['name'])),
      period: utf8.decode(latin1.encode(json['period'])),
      composer: utf8.decode(latin1.encode(json['composer'])),
      parts: jsonParts,
      reviews: jsonReviews,
    );
  }
}