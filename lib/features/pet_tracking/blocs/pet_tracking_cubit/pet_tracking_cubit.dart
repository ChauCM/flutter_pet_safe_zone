import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

import '../../models/pet_location_dpo.dart';
import 'pet_tracking_state.dart';

class PetTrackingCubit extends Cubit<PetTrackingState> {
  Timer? _movementTimer;
  final Random _random = Random();
  final Distance _distance = const Distance();

  static const LatLng homeLocation = LatLng(
    40.416775,
    -3.703790,
  ); // Madrid coordinates
  static const double safeZoneRadius = 200.0;
  static const double movementSpeed = 0.00002;

  double _direction = 0;

  PetTrackingCubit()
    : super(
        const PetTrackingState(
          petLocation: PetLocationDpo(
            currentLocation: homeLocation,
            isInsideSafeZone: true,
            distanceFromHome: 0,
          ),
        ),
      ) {
    _direction = _random.nextDouble() * 2 * pi;
    _startMovement();
  }

  void _startMovement() {
    _movementTimer?.cancel();
    _movementTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // Random direction changes
      _direction += (_random.nextDouble() - 0.5) * 0.8;

      // Position update
      final current = state.petLocation.currentLocation;
      final newLocation = LatLng(
        current.latitude + cos(_direction) * movementSpeed,
        current.longitude + sin(_direction) * movementSpeed,
      );

      final distanceFromHome = _distance.as(
        LengthUnit.Meter,
        homeLocation,
        newLocation,
      );

      final isInsideSafeZone = distanceFromHome <= safeZoneRadius;

      emit(
        state.copyWith(
          petLocation: PetLocationDpo(
            currentLocation: newLocation,
            isInsideSafeZone: isInsideSafeZone,
            distanceFromHome: distanceFromHome,
          ),
        ),
      );
    });
  }

  void toggleAnnounce() {
    emit(
      state.copyWith(
        isAnnounceEnabled: !state.isAnnounceEnabled,
      ),
    );
  }

  void returnToHome() {
    emit(
      state.copyWith(
        petLocation: PetLocationDpo(
          currentLocation: homeLocation,
          isInsideSafeZone: true,
          distanceFromHome: 0,
        ),
      ),
    );
  }

  void restart() {
    // Reset to home with new random direction
    _direction = _random.nextDouble() * 2 * pi;

    emit(
      state.copyWith(
        petLocation: PetLocationDpo(
          currentLocation: homeLocation,
          isInsideSafeZone: true,
          distanceFromHome: 0,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _movementTimer?.cancel();
    return super.close();
  }
}
