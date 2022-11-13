import 'package:flutter/material.dart';

import '../models/musician.dart';

class MusicianWidget extends StatelessWidget {
  const MusicianWidget({super.key, required List<Musician> this.musicianList});

  final List<Musician> musicianList;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: this.musicianList.map((musician) => 
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  musician.name,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  musician.yearOfBirth.toString() + " - " + musician.yearOfDeath!.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              )
            ]
          )
        ).toList()
      )
    );
  }
}
