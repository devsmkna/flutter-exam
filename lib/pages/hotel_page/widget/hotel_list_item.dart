import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/hotel.dart';

class HotelListItem extends StatelessWidget {
  final Hotel item;
  const HotelListItem({
    super.key,
    required this.item,
  });

  Color getColor() {
    if (item.voteAverage >= 8) {
      return Colors.green;
    } else if (item.voteAverage >= 5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          width: double.infinity,
          height: 200,
          fit: BoxFit.fitWidth,
          image: NetworkImage(item.mainPhoto),
        ),
        ListTile(
          title: Text(item.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(item.description),
          onTap: () => context.go('/${item.id}'),
          trailing: Text(item.voteAverage.toStringAsFixed(2),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: getColor())),
        )
      ],
    );
  }
}
