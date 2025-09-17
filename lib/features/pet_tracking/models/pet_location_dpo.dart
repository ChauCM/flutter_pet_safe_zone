import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'pet_location_dpo.freezed.dart';

@freezed
sealed class PetLocationDpo with _$PetLocationDpo {
  const factory PetLocationDpo({
    required LatLng currentLocation,
    required bool isInsideSafeZone,
    required double distanceFromHome,
  }) = _PetLocationDpo;

  const PetLocationDpo._();

  // bucket the distance 50m from home
  int get fiftyMBucket => (distanceFromHome ~/ 50) * 50;
}
