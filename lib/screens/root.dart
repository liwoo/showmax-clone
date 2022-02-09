import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showmax_clone/bloc/movie_cubit.dart';
import 'package:showmax_clone/widgets/custom_app_bar.dart';
import 'package:showmax_clone/widgets/custom_tool_bar.dart';
import 'package:showmax_clone/widgets/movie_thumbnail.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final ScrollController _scrollController = ScrollController();
  double _offset = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieCubit>(context).getMovieLading();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight = MediaQuery.of(context).size.height * 0.6;
    return BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
      if (state is MovieLandingLoading) {
        return Scaffold(
          body: Center(
            child: Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
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
          bottomNavigationBar: BottomAppBar(
              color: Colors.black,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 66,
                  color: Colors.black,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        NavButton(
                            icon: Icons.home, label: 'Home', isActive: true),
                        NavButton(icon: Icons.folder_outlined, label: "Series"),
                        NavButton(
                            icon: Icons.video_library_outlined,
                            label: "Movies"),
                        NavButton(icon: Icons.sports_soccer, label: "Sports"),
                        NavButton(
                            icon: Icons.horizontal_distribute, label: "More"),
                      ]))),
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  CustomAppBar(
                      shrinkOffset: _offset,
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
                          children: state.liveMovies.map((m) {
                            return MovieThumbnail(
                              movie: m,
                              isLive: true,
                              isLarge: true,
                              image: m.posterUrl,
                            );
                          }).toList())),
                  HorizontalSection(
                      title: 'Only on Showmax',
                      list: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.exclusives.map((m) {
                            return MovieThumbnail(
                              movie: m,
                              image: m.posterUrl,
                            );
                          }).toList())),
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
                      title:
                          'Because you watched Temptation Island South Africa',
                      list: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.recommendedMovies.map((m) {
                            return MovieThumbnail(image: m.posterUrl, movie: m);
                          }).toList())),
                  HorizontalSection(
                      title: 'Top 20 on Showmax',
                      list: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.popularMovies.map((m) {
                            return MovieThumbnail(image: m.posterUrl, movie: m);
                          }).toList())),
                  HorizontalSection(
                      title: 'Coming on Showmax',
                      list: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.upcomingMovies.map((m) {
                            return MovieThumbnail(image: m.posterUrl, movie: m);
                          }).toList())),
                  HorizontalSection(
                      title: 'Trending',
                      list: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.trendingMovies.map((m) {
                            return MovieThumbnail(
                                isLarge: true, image: m.posterUrl, movie: m);
                          }).toList())),
                  HorizontalSection(
                      title: 'Blokbusters',
                      list: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.randomMovies.map((m) {
                            return MovieThumbnail(image: m.posterUrl, movie: m);
                          }).toList())),
                ],
              ),
              CustomToolBar(
                minHeight: 30,
                shrinkOffset: _offset,
                padding: 10,
                maxHeight: 100,
              )
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

class NavButton extends StatelessWidget {
  const NavButton(
      {Key? key,
      this.isActive = false,
      required this.label,
      required this.icon})
      : super(key: key);

  final String label;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(icon,
          size: 28,
          color: isActive ? Colors.pink : Colors.white.withOpacity(0.8)),
      Text(label,
          style: TextStyle(
            color: isActive ? Colors.pink : Colors.white.withOpacity(0.8),
          ))
    ]);
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
