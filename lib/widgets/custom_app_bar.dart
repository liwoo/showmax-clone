import 'package:flutter/material.dart';
import 'package:showmax_clone/widgets/watch_button.dart';
import 'package:showmax_clone/widgets/watch_option.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.height,
      required this.imageUrl})
      : super(key: key);

  final double height;
  final String imageUrl;
  final String title;

  final iconsWidth = 32.0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        expandedHeight: MediaQuery.of(context).size.height * 0.6,
        stretch: true,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [StretchMode.zoomBackground],
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                    Positioned(
                        bottom: -2,
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                  Colors.black.withOpacity(1),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.0),
                                ])),
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width,
                            child: Text(title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    Expanded(child: SizedBox()),
                    WatchButton(),
                    Expanded(child: SizedBox())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const WatchOption(
                        icon: Icons.file_copy_sharp, title: "Episodes"),
                    SizedBox(width: iconsWidth),
                    const WatchOption(icon: Icons.movie, title: "Trailer"),
                    SizedBox(width: iconsWidth),
                    const WatchOption(icon: Icons.add, title: "Watchlist"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
