import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/musicianWidget.dart';
import '../widgets/pieceWidget.dart';
import '../widgets/reviewWidget.dart';
import '../models/instrument.dart';
import '../models/piece.dart';
import 'home.dart';

class HistoryPage extends StatefulWidget {
  final String instrumentName;
  const HistoryPage({
      Key? key,
      required this.instrumentName
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<Instrument> futureInstrument;
  late Future<Piece> futurePiece;

  @override
  void initState() {
    super.initState();
    futureInstrument = fetchInstrument(this.widget.instrumentName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        ), 
        title: const Text("Instruments"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Instrument>(
          future: futureInstrument,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data!.name,
                        style: TextStyle(
                          fontSize: 35.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data!.collection + " - " + snapshot.data!.period,
                        style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data!.description,
                        style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Musicians",
                        style: TextStyle(
                          fontSize: 24.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    (snapshot.data!.musicians.length != 0)
                    ? MusicianWidget(musicianList: snapshot.data!.musicians)
                    : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No musicians are known for this instrument.",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pieces",
                        style: TextStyle(
                          fontSize: 24.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    (snapshot.data!.pieces.length != 0)
                    ? PieceWidget(
                      pieceList: snapshot.data!.pieces,
                      showDetails: (String name) {
                        _showBottomModal(context, name);
                      },
                    )
                    : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No pieces are known for this instrument.",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                )
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator()
            );
          },
        ),
      )
    );
  }

  Future<Instrument> fetchInstrument(String name) async {
    final response = await http
        .get(Uri.parse('https://api-edge-johantorfs.cloud.okteto.net/instrument/' + name));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Instrument.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load instrument');
    }
  }

  Future<Piece> fetchPiece(String name) async {
    print(Uri.parse('https://api-edge-johantorfs.cloud.okteto.net/piece/' + name));
    final response = await http
        .get(Uri.parse('https://api-edge-johantorfs.cloud.okteto.net/piece/' + name));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Piece.fromJson(jsonDecode(response.body)[0]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load piece');
    }
  }

  _showBottomModal(BuildContext context, String name) {
    futurePiece = this.fetchPiece(name);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return new FutureBuilder<Piece>(
          future: futurePiece,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      snapshot.data!.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ReviewWidget(piece: snapshot.data!),
                  ]
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        );
      }
    );
  }
}