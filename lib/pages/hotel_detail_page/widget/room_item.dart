import 'package:flutter/material.dart';

import '../../../models/room.dart';
import 'voice_item.dart';

class RoomItem extends StatelessWidget {
  final Room room;
  const RoomItem({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(room.image, height: 300),
          VoiceItem(title: 'Camera Type', content: room.type),
          VoiceItem(title: 'Adults', content: room.adults.toString()),
          VoiceItem(title: 'Square Meters', content: room.mq.toString()),
          VoiceItem(
              title: 'Price Per Night', content: room.priceForNight.toString()),
        ],
      ),
    );
  }
}
