import './instrument.dart';
import 'dart:convert';

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
      instrument: utf8.decode(latin1.encode(json['instrument'])),
      name: utf8.decode(latin1.encode(json['name'])),
      instrumentObj: Instrument.fromJson(json['instrumentObj']),
    );
  }
}