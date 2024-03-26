import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../models/hotel_detail.dart';
import 'hotel_detail_state.dart';

class HotelDetailCubit extends Cubit<HotelDetailState> {
  final uri =
      'https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/hotels/hotel_details';
  HotelDetailCubit() : super(const HotelDetailState());

  void getById(int id) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
    ));

    try {
      final response = await http.get(Uri.parse('$uri/$id'));

      if (response.statusCode == 200) {
        final item = HotelDetail.fromJson(jsonDecode(response.body));

        emit(state.copyWith(
          item: item,
          isLoading: false,
          hasError: false,
        ));
      } else {
        throw Exception('Error while get data by id');
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    }
  }
}
