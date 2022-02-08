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
  final _offset = 0.0;

  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)!.settings.arguments as Movie;
    var appBarHeight = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CustomAppBar(
                title: movie.title,
                height: appBarHeight,
                imageUrl: movie.posterUrl,
              ),
              SliverToBoxAdapter(
                child: Text(movie.title,
                    style: const TextStyle(fontSize: 24, color: Colors.white)),
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
