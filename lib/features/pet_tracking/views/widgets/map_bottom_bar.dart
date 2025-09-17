import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import 'keyboard_guide_dialog.dart';

class MapBottomBar extends StatelessWidget {
  final AnimatedMapController animatedMapController;

  const MapBottomBar({super.key, required this.animatedMapController});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Semantics(
            button: true,
            label: 'Center map on Tim\'s current location',
            child: ElevatedButton.icon(
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
          ),
          Semantics(
            button: true,
            label: 'Restart tracking and center map on home location',
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<PetTrackingCubit>().restart();
                animatedMapController.animateTo(
                  dest: PetTrackingCubit.homeLocation,
                  zoom: 17.0,
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Restart'),
            ),
          ),
          Semantics(
            button: true,
            label: 'Show keyboard shortcuts guide',
            child: ElevatedButton.icon(
              onPressed: () {
                KeyboardGuideDialog.show(context);
              },
              icon: const Icon(Icons.keyboard),
              label: const Text('Keyboard Guide'),
            ),
          ),
        ],
      ),
    );
  }
}
