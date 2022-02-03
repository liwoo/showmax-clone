import 'package:flutter/material.dart';
import 'package:showmax_clone/widgets/custom_app_bar.dart';
import 'package:showmax_clone/widgets/movie_thumbnail.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  final image =
      'https://showmax.akamaized.net/i/26f8064e-8fe4-4c87-8efc-edcaf5315dcb/format=webp/q=70/1600x';
  @override
  Widget build(BuildContext context) {
    var appBarHeight = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
              height: appBarHeight, imageUrl: image, title: 'Insecure'),
          HorizontalSection(
              title: 'Top Picks for Alinafe',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              title: 'Continue Watching',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10,
                      (index) => MovieThumbnail(image: image, isLarge: true)))),
          HorizontalSection(
              title: 'Live Channels',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10,
                      (index) => MovieThumbnail(image: image, isLarge: true)))),
          HorizontalSection(
              title: 'Only on Showmax',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              title: 'The Best of HBO',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              title: 'Recently Added Movies',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              title: 'Because you watched Temptation Island South Africa',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              title: 'Recently Added Movies',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10,
                      (index) => MovieThumbnail(image: image, isLarge: true)))),
          HorizontalSection(
              title: 'Top 20 on Showmax',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              title: 'Coming on Showmax',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10,
                      (index) => MovieThumbnail(image: image, isLarge: true)))),
          HorizontalSection(
              title: 'Trending',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10,
                      (index) => MovieThumbnail(image: image, isLarge: true)))),
          HorizontalSection(
              title: 'Blokbusters',
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
        ],
      ),
    );
  }
}

class HorizontalSection extends StatelessWidget {
  const HorizontalSection({Key? key, required this.list, required this.title})
      : super(key: key);

  final Widget list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white)),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.16, child: list)
          ],
        ),
      ),
    );
  }
}
