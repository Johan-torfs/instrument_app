
//hier word de afbeelding uitgehaal die in assets zijn te vinden

import 'package:flutter/material.dart';

void main() => runApp(InstrumentLoad());

// ignore: non_constant_identifier_names
InstrumentLoad() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/violin.jpeg'),
      fit: BoxFit.cover,
    ),
  );
}
