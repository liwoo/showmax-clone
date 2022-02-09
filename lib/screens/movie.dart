import 'package:flutter/material.dart';
import 'package:showmax_clone/models/movie.dart';
import 'package:showmax_clone/widgets/custom_app_bar.dart';
import 'package:showmax_clone/widgets/custom_tool_bar.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final ScrollController _scrollController = ScrollController();
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)!.settings.arguments as Movie;
    var appBarHeight = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              CustomAppBar(
                shrinkOffset: _offset,
                shouldFade: true,
                title: movie.title,
                height: appBarHeight,
                imageUrl: movie.posterUrl,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Placeholder(fallbackHeight: 200),
                    const Placeholder(fallbackHeight: 200),
                    Text(movie.title,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          CustomToolBar(
            minHeight: 30,
            isDetails: true,
            shrinkOffset: _offset,
            padding: 10,
            maxHeight: 100,
          )
        ],
      ),
    );
  }
}
