import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/hotel_cubit.dart';
import 'widget/hotel_list.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        actions: [
          IconButton(
              onPressed: () => context.read<HotelCubit>().toggleSort(),
              icon: const Icon(Icons.sort)),
        ],
      ),
      body: const HotelList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<HotelCubit>().getAll(),
          child: const Icon(Icons.refresh)),
    );
  }
}
