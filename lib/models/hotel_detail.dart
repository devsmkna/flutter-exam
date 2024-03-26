// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'room.dart';

part 'hotel_detail.freezed.dart';
part 'hotel_detail.g.dart';

@freezed
class HotelDetail with _$HotelDetail {
  const factory HotelDetail({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'rooms') required List<Room> rooms,
  }) = _HotelDetail;

  factory HotelDetail.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailFromJson(json);
}
