import 'package:flutter/material.dart';

class WatchOption extends StatelessWidget {
  const WatchOption({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Icon(icon, color: Colors.white)),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
