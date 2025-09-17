import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/pet_location_dpo.dart';

part 'pet_tracking_state.freezed.dart';

@freezed
sealed class PetTrackingState with _$PetTrackingState {
  const factory PetTrackingState({
    required PetLocationDpo petLocation,
    @Default(true) bool isAnnounceEnabled,
  }) = _PetTrackingState;
}
