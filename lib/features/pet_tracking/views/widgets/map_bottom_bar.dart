import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';

class MapBottomBar extends StatelessWidget {
  final AnimatedMapController animatedMapController;

  const MapBottomBar({
    super.key,
    required this.animatedMapController,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                final currentLocation = context
                    .read<PetTrackingCubit>()
                    .state
                    .petLocation
                    .currentLocation;
                animatedMapController.animateTo(
                  dest: currentLocation,
                  zoom: 17.0,
                );
              },
              icon: const Icon(Icons.pets),
              label: const Text('Tim Location'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<PetTrackingCubit>().restart();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Restart'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.keyboard),
              label: const Text('Keyboard Guide'),
            ),
          ],
        ),
      ),
    );
  }
}