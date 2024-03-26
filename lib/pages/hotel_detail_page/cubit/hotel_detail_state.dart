import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/hotel_detail.dart';

part 'hotel_detail_state.freezed.dart';

@freezed
class HotelDetailState with _$HotelDetailState {
  const factory HotelDetailState({
    HotelDetail? item,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _HotelDetailState;
}
