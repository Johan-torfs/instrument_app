import 'package:flutter/material.dart';

import 'ratingWidget.dart';

class ReviewPostWidget extends StatefulWidget {
  const ReviewPostWidget({
    Key? key,
    required Function(String, int) this.postReview,
  }) : super(key: key);

  final Function(String, int) postReview;

  @override
  State<StatefulWidget> createState() => _ReviewPostWidgetState();
}

class _ReviewPostWidgetState extends State<ReviewPostWidget> {
  TextEditingController _commentController = TextEditingController();
  int _submitStep = 0;
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget> [
          TextField(
            controller: _commentController,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your review',
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: IconButton(
              icon: Icon(
                Icons.send_rounded,
                size: 25,
                color: Colors.blue,
              ),
              onPressed: () => setState(() {
                this._submitStep = 1;
              }
            ))
          ),
          if (this._submitStep == 1) Positioned(
            bottom: 8.0,
            right: 8.0,
            top: 8.0,
            left: 8.0,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  )
                ],
              ),
              child: Row(
                children: <Widget> [
                  GestureDetector(
                    onTapUp: (TapUpDetails details) => _onTapUp(details),
                    child: RatingWidget(rating: this._rating, size: 40)
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      size: 25,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      this.widget.postReview(this._commentController.text, this._rating);
                      this._commentController.text = "";
                      this._rating = 0;
                      this._submitStep = 0;
                    }
                  ),
                ]
              ),
            )
          ),
        ]
      )
    );
  }

  _onTapUp(TapUpDetails details) {
    var x = details.localPosition.dx;
    setState(() {
      this._rating = (x/20).round();
    });
  }
}