import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showmax_clone/bloc/movie_cubit.dart';
import 'package:showmax_clone/models/movie.dart';
import 'package:showmax_clone/widgets/custom_app_bar.dart';
import 'package:showmax_clone/widgets/movie_thumbnail.dart';

Movie sampleMovie = const Movie(
  imdbId: "tt0111161",
  title: 'The Shawshank Redemption',
  posterUrl: 'https://image.tmdb.org/t/p/w500/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
);

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final image =
      'https://showmax.akamaized.net/i/26f8064e-8fe4-4c87-8efc-edcaf5315dcb/format=webp/q=70/1600x';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieCubit>(context).getMovieLading();
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight = MediaQuery.of(context).size.height * 0.6;
    return BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
      if (state is MovieLandingLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is MovieLandingLoadingFailed) {
        return const Scaffold(
          body: Center(
            child: Text('Failed to load movies'),
          ),
        );
      }
      if (state is MovieLandingLoadingSuccessful) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomAppBar(
                  height: appBarHeight,
                  imageUrl: state.promoted.posterUrl,
                  title: state.promoted.title),
              HorizontalSection(
                  title: 'Top Picks for Alinafe',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.topPicks.map((m) {
                        return MovieThumbnail(
                          movie: m,
                          image: m.posterUrl,
                        );
                      }).toList())),
              HorizontalSection(
                  title: 'Continue Watching',
                  heightFactor: 0.2,
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.continueWatching.map((m) {
                        return MovieThumbnail(
                          withControls: true,
                          isLarge: true,
                          movie: m,
                          image: m.posterUrl,
                        );
                      }).toList())),
              HorizontalSection(
                  title: 'Live Channels',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image,
                              isLive: true,
                              isLarge: true,
                              movie: sampleMovie)))),
              HorizontalSection(
                  title: 'Only on Showmax',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image, movie: sampleMovie)))),
              HorizontalSection(
                  title: 'The Best of HBO',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.bestOf.map((m) {
                        return MovieThumbnail(image: m.posterUrl, movie: m);
                      }).toList())),
              HorizontalSection(
                  title: 'Recently Added Movies',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.recentMovies.map((m) {
                        return MovieThumbnail(image: m.posterUrl, movie: m);
                      }).toList())),
              HorizontalSection(
                  title: 'Because you watched Temptation Island South Africa',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image, movie: sampleMovie)))),
              HorizontalSection(
                  title: 'Recently Added Movies',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image,
                              isLarge: true,
                              movie: sampleMovie)))),
              HorizontalSection(
                  title: 'Top 20 on Showmax',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image, movie: sampleMovie)))),
              HorizontalSection(
                  title: 'Coming on Showmax',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image,
                              isLarge: true,
                              movie: sampleMovie)))),
              HorizontalSection(
                  title: 'Trending',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image,
                              isLarge: true,
                              movie: sampleMovie)))),
              HorizontalSection(
                  title: 'Blokbusters',
                  list: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => MovieThumbnail(
                              image: image, movie: sampleMovie)))),
            ],
          ),
        );
      }
      return const Scaffold(
          body: Center(
        child:
            Text('Hello', style: TextStyle(fontSize: 30, color: Colors.pink)),
      ));
    });
  }
}

class HorizontalSection extends StatelessWidget {
  const HorizontalSection(
      {Key? key,
      required this.list,
      required this.title,
      this.heightFactor = 0.16})
      : super(key: key);

  final Widget list;
  final String title;
  final double heightFactor;

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
                height: MediaQuery.of(context).size.height * heightFactor,
                child: list)
          ],
        ),
      ),
    );
  }
}
