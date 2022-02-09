import 'package:flutter/material.dart';
import 'package:showmax_clone/widgets/watch_button.dart';
import 'package:showmax_clone/widgets/watch_option.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.height,
      this.shouldFade = false,
      required this.shrinkOffset,
      required this.imageUrl})
      : super(key: key);

  final double height;
  final String imageUrl;
  final String title;
  final double shrinkOffset;
  final bool shouldFade;

  final iconsWidth = 32.0;

  double getFadeOpacity(shrinkOffset) {
    var opacity = (1 - (shrinkOffset.abs() / 300)).clamp(0, 1).toDouble();
    return shrinkOffset < 0 && shouldFade ? opacity : 1;
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        stretchTriggerOffset: 100,
        onStretchTrigger: () async {
          await Future.delayed(const Duration(milliseconds: 300));
          if (shouldFade) Navigator.pop(context);
        },
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
                    Opacity(
                      opacity: getFadeOpacity(shrinkOffset),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: -2,
                        child: Opacity(
                          opacity: getFadeOpacity(shrinkOffset),
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.0),
                                  ])),
                              padding: const EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width,
                              child: Text(title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold))),
                        ))
                  ],
                ),
              ),
              Opacity(
                opacity: getFadeOpacity(shrinkOffset),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Expanded(child: SizedBox()),
                      WatchButton(),
                      Expanded(child: SizedBox())
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: getFadeOpacity(shrinkOffset),
                child: Padding(
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
                ),
              )
            ],
          ),
        ));
  }
}
