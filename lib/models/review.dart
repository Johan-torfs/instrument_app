import './piece.dart';
import 'dart:convert';

class Review {
  final String id;
  final int rating;
  final String comment;
  final String pieceName;
  final Piece piece;

  const Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.pieceName,
    required this.piece,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      pieceName: json['pieceName'],
      piece: Piece.fromJson(json['piece']),
    );
  }
}