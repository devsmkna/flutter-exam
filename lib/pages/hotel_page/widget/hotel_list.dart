import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/hotel_cubit.dart';
import 'hotel_list_item.dart';

class HotelList extends StatelessWidget {
  const HotelList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HotelCubit>().state;
    final list = state.sortedList;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.hasError) {
      return const Center(
        child: Text('Error while get all data'),
      );
    }

    if (list.isEmpty) {
      return const Center(
        child: Text('No data'),
      );
    }

    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) => HotelListItem(
        item: list[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
