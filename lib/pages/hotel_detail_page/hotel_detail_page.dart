import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/hotel_detail_cubit.dart';
import 'widget/room_item.dart';
import 'widget/voice_item.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HotelDetailCubit>().state;
    final item = state.item;

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.hasError) {
      return const Scaffold(
        body: Center(
          child: Text('Error while get data by id'),
        ),
      );
    }

    if (item == null) {
      return const Scaffold(
        body: Center(
          child: Text('Invalid ID'),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(item.name),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 16),
            VoiceItem(
              title: 'Address',
              content: item.address,
            ),
            const Divider(),
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children:
                    item.rooms.map((room) => RoomItem(room: room)).toList(),
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
