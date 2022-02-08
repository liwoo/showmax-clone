import 'dart:math';

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
  const MovieThumbnail(
      {Key? key,
      required this.image,
      required this.movie,
      this.withControls = false,
      this.isLive = false,
      this.isLarge = false})
      : super(key: key);

  final String image;
  final bool isLarge;
  final Movie movie;
  final bool isLive;
  final bool withControls;

  @override
  Widget build(BuildContext context) {
    var widthFactor = (isLarge ? largeThumbWidthFactor : smallThumbWidthFactor);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * widthFactor,
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * widthFactor,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/movieDetails', arguments: movie);
                          },
                          child: CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: Container(color: Colors.grey),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Container(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -1,
                          right: -1,
                          child: SvgPicture.asset(
                              'assets/images/${labelToImage[movie.label]}')),
                      if (withControls)
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10.0,
                                    spreadRadius: 5.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(64)),
                            child: IconButton(
                              icon: const Icon(Icons.play_arrow,
                                  color: Colors.black, size: 32),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      if (withControls)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                )
                              ],
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.more_vert),
                                color: Colors.white,
                                onPressed: () {}),
                          ),
                        ),
                      if (withControls)
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: SizedBox(
                            width:
                                MediaQuery.of(context).size.width * widthFactor,
                            child: LinearProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.black.withOpacity(0.2),
                                value: movie.playbackLength),
                          ),
                        ),
                      if (isLive)
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: const Text("Live",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (withControls)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 12, color: Colors.white.withOpacity(0.8)),
              ),
            ),
        ],
      ),
    );
  }
}
