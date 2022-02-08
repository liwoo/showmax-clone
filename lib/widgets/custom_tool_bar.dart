import 'package:flutter/material.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar(
      {Key? key,
      required this.minHeight,
      required this.padding,
      required this.shrinkOffset,
      this.user = "Alinafe",
      this.isDetails = false,
      required this.maxHeight})
      : super(key: key);

  final double minHeight;
  final double maxHeight;
  final double padding;
  final double shrinkOffset;
  final String user;
  final bool isDetails;

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha =
        (shrinkOffset / (maxHeight + 350) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: maxHeight,
      child: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                Color(0x40000000),
                Color(0x00000000),
              ]))),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.only(
                      left: 18, right: 18, bottom: maxHeight - minHeight),
                  color: makeStickyHeaderBgColor(shrinkOffset),
                  child: SafeArea(
                      bottom: false,
                      child: SizedBox(
                          height: minHeight,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (isDetails)
                                  Transform.translate(
                                    offset: const Offset(-10, 0),
                                    child: IconButton(
                                        icon: const Icon(Icons.close),
                                        iconSize: 28,
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ),
                                if (!isDetails)
                                  Row(
                                    children: [
                                      Container(
                                          width: 28,
                                          height: 28,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: Colors.pink),
                                          child: const Text("A",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white))),
                                      const SizedBox(width: 8),
                                      const Text("Alinafe",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: const Icon(Icons.cast,
                                              color: Colors.white),
                                          onPressed: () {}),
                                      IconButton(
                                          icon: const Icon(Icons.search,
                                              color: Colors.white),
                                          onPressed: () {}),
                                      if (isDetails)
                                        IconButton(
                                            icon: const Icon(Icons.share,
                                                color: Colors.white),
                                            onPressed: () {}),
                                    ]),
                              ])))))
        ],
      ),
    );
  }
}
