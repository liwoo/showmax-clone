import 'package:flutter/material.dart';

class WatchButton extends StatelessWidget {
  const WatchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.play_arrow,
              size: 26,
              color: Colors.black,
            ),
            Text("Watch now",
                style: TextStyle(fontSize: 18, color: Colors.black))
          ],
        ));
  }
}
