import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
    required int this.rating,
    double this.size: 20.0,
  }) : super(key: key);

  final int rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [for (var i = 1; i <= 5; i++) i].map((i) => getStar(this.rating, i)).toList()
      )
    );
  }

  Icon getStar(int rating, int position) {
    if ((rating/2 - position) >= 0) {
      return Icon(
        Icons.star_rounded,
        size: this.size,
        color: Colors.yellow,
      );
    } else if ((rating/2 - position) > -1) {
      return Icon(
        Icons.star_half_rounded,
        size: this.size,
        color: Colors.yellow,
      );
    } else {
      return Icon(
        Icons.star_border_rounded,
        size: this.size,
        color: Colors.yellow,
      );
    }
  }
}
