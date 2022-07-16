import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StarHolderContainer extends StatefulWidget {
  final int diff;
  const StarHolderContainer({Key? key, required this.diff}) : super(key: key);

  @override
  State<StarHolderContainer> createState() => _StarHolderContainerState();
}

class _StarHolderContainerState extends State<StarHolderContainer> {
  @override
  Widget build(BuildContext context) {
    late Container finalContainer;

    if (widget.diff == 1) {
      finalContainer = Container(
        child: Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
          ],
        ),
      );
    } else if (widget.diff == 2) {
      finalContainer = Container(
        child: Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
          ],
        ),
      );
    } else if (widget.diff == 3) {
      finalContainer = Container(
        child: Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
          ],
        ),
      );
    } else if (widget.diff == 4) {
      finalContainer = Container(
        child: Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
          ],
        ),
      );
    } else if (widget.diff == 5) {
      finalContainer = Container(
        child: Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        ),
      );
    }

    return finalContainer;
  }
}
