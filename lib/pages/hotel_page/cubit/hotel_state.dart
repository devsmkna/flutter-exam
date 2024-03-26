import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/hotel.dart';

part 'hotel_state.freezed.dart';

@freezed
class HotelState with _$HotelState {
  const HotelState._();

  const factory HotelState({
    @Default([]) List<Hotel> list,
    @Default(false) bool isAsc,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _HotelState;

  List<Hotel> get sortedList {
    final sortList = List<Hotel>.from(list);
    sortList.sort((a, b) => isAsc
        ? a.voteAverage.compareTo(b.voteAverage)
        : b.voteAverage.compareTo(a.voteAverage));
    return sortList;
  }
}
