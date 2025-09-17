import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_state.dart';

class MapControlButtons extends StatelessWidget {
  const MapControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.contrast),
            label: const Text('High Contrast'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          const SizedBox(width: 8),
          BlocBuilder<PetTrackingCubit, PetTrackingState>(
            builder: (context, state) {
              return ElevatedButton.icon(
                onPressed: () {
                  context.read<PetTrackingCubit>().toggleAnnounce();
                },
                icon: Icon(
                  state.isAnnounceEnabled ? Icons.volume_up : Icons.volume_off,
                  color: state.isAnnounceEnabled ? Colors.white : null,
                ),
                label: Text(
                  state.isAnnounceEnabled ? 'Announce On' : 'Announce Off',
                  style: TextStyle(
                    color: state.isAnnounceEnabled ? Colors.white : null,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: state.isAnnounceEnabled
                      ? Colors.green
                      : null,
                  foregroundColor: state.isAnnounceEnabled
                      ? Colors.white
                      : null,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
            label: const Text('Help'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}