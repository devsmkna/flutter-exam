import 'package:flutter/material.dart';

class VoiceItem extends StatelessWidget {
  final String title;
  final String content;

  const VoiceItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(content, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
