import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../models/hotel.dart';
import 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final uri =
      'https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/hotels/hotels';
  HotelCubit() : super(const HotelState());

  void getAll() async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
    ));

    try {
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final list = (jsonDecode(response.body) as List)
            .map((item) => Hotel.fromJson(item))
            .toList();

        emit(state.copyWith(
          list: list,
          isLoading: false,
          hasError: false,
        ));
      } else {
        throw Exception('Error while get all data');
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    }
  }

  void toggleSort() {
    emit(state.copyWith(isAsc: !state.isAsc));
  }
}
