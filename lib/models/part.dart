import './instrument.dart';
import 'dart:convert';

class Part {
  final String instrument;
  final String name;
  final Instrument? instrumentObj;

  const Part({
    required this.instrument,
    required this.name,
    this.instrumentObj,
  });

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      instrument: utf8.decode(latin1.encode(json['instrument'])),
      name: utf8.decode(latin1.encode(json['name'])),
      instrumentObj: json['instrumentObj'] != null ? Instrument.fromJson(json['instrumentObj']) : null,
    );
  }
}