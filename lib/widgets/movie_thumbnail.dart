import 'package:flutter/material.dart';

const double smallThumbWidthFactor = 0.4;
const double largeThumbWidthFactor = 0.65;

class MovieThumbnail extends StatelessWidget {
  const MovieThumbnail({Key? key, required this.image, this.isLarge = false})
      : super(key: key);

  final String image;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    var widthFactor = (isLarge ? largeThumbWidthFactor : smallThumbWidthFactor);
    return Container(
      width: MediaQuery.of(context).size.width * widthFactor,
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * widthFactor,
        child: Image.network(
          image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
