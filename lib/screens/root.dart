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
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10, (index) => MovieThumbnail(image: image)))),
          HorizontalSection(
              list: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10,
                      (index) => MovieThumbnail(image: image, isLarge: true)))),
        ],
      ),
    );
  }
}

class HorizontalSection extends StatelessWidget {
  const HorizontalSection({Key? key, required this.list}) : super(key: key);

  final Widget list;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text("Top picks for Alinafe",
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.16, child: list)
          ],
        ),
      ),
    );
  }
}
