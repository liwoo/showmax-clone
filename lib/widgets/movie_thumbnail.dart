import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showmax_clone/models/movie.dart';

final Map<Labels, String> labelToImage = {
  Labels.newSeason: 'new_season.svg',
  Labels.newEpisode: 'new_episode.svg',
  Labels.newThing: 'new_thing.svg',
  Labels.comingSoon: 'coming_soon.svg',
  Labels.none: '',
};

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
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * widthFactor,
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => Center(
                child: Container(color: Colors.grey),
              ),
              errorWidget: (context, url, error) => Center(
                child: Container(color: Colors.red),
              ),
            ),
          ),
          Positioned(
            top: -1,
            right: 0,
            child: SvgPicture.asset('assets/images/new_thing.svg'),
          )
        ],
      ),
    );
  }
}
