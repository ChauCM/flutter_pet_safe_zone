import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/common/blocs/theme_cubit/theme_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_state.dart';
import 'keyboard_guide_dialog.dart';

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
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              final theme = themeState.themeConfig;
              return ElevatedButton.icon(
                onPressed: () {
                  context.read<ThemeCubit>().toggleHighContrast();
                },
                icon: const Icon(Icons.contrast),
                label: const Text('High Contrast'),
                style: themeState.isHighContrast
                    ? ElevatedButton.styleFrom(
                        backgroundColor: theme.activeButtonBackgroundColor,
                        foregroundColor: theme.activeButtonForegroundColor,
                        side: theme.buttonBorderSide,
                      )
                    : null,
              );
            },
          ),
          const SizedBox(width: 8),
          BlocBuilder<PetTrackingCubit, PetTrackingState>(
            builder: (context, state) {
              final theme = context.watch<ThemeCubit>().state.themeConfig;
              return ElevatedButton.icon(
                onPressed: () {
                  context.read<PetTrackingCubit>().toggleAnnounce();
                },
                icon: Icon(
                  state.isAnnounceEnabled ? Icons.volume_up : Icons.volume_off,
                ),
                label: Text(
                  state.isAnnounceEnabled ? 'Announce On' : 'Announce Off',
                ),
                style: state.isAnnounceEnabled
                    ? ElevatedButton.styleFrom(
                        backgroundColor: theme.activeButtonBackgroundColor,
                        foregroundColor: theme.activeButtonForegroundColor,
                      )
                    : null,
              );
            },
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () {
              KeyboardGuideDialog.show(context);
            },
            icon: const Icon(Icons.help_outline),
            label: const Text('Help'),
          ),
        ],
      ),
    );
  }
}