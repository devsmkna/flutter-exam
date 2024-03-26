import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/hotel_page/cubit/hotel_cubit.dart';
import 'pages/hotel_detail_page/cubit/hotel_detail_cubit.dart';
import 'pages/hotel_page/hotel_page.dart';
import 'pages/hotel_detail_page/hotel_detail_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => BlocProvider(
                  create: (context) => HotelCubit()..getAll(),
                  child: const HotelPage(),
                ),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = int.tryParse('${state.pathParameters['id']}');

                  if (id == null) {
                    return const Scaffold(
                      body: Center(
                        child: Text('Invalid ID'),
                      ),
                    );
                  }

                  return BlocProvider(
                    create: (context) => HotelDetailCubit()..getById(id),
                    child: const HotelDetailPage(),
                  );
                },
              )
            ])
      ]),
    );
  }
}
