import 'package:flutter/material.dart';

import '../models/piece.dart';


class PieceWidget extends StatefulWidget {
  const PieceWidget({
    Key? key,
    required List<Piece> this.pieceList,
    required Function(String) this.showDetails
  }) : super(key: key);

  final List<Piece> pieceList;
  final Function(String) showDetails;

  @override
  State<StatefulWidget> createState() => _PieceWidgetState();
}

class _PieceWidgetState extends State<PieceWidget> {
  String playingId = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: this.widget.pieceList.map((piece) => 
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              this.widget.showDetails(piece.name);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 200, 200, 255),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                children: <Widget> [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        piece.name,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        piece.composer + " - " + piece.period,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ]
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => setState(() {
                      this.playingId = this.playingId != piece.id ? piece.id : "";
                    }),
                    icon: (this.playingId != piece.id) 
                    ? Icon(
                      Icons.not_started_outlined,
                      size: 35,
                      color: Colors.green,
                    )
                    : Icon(
                      Icons.motion_photos_pause,
                      size: 35, 
                      color: Colors.orange
                    )
                  )
                ]
              )
            )
          )
        ).toList()
      )
    );
  }
}
