import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_state.dart';
import '../widgets/cat_marker_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐾 Tim Safe Zone Tracker'),
        centerTitle: true,
      ),
      body: BlocBuilder<PetTrackingCubit, PetTrackingState>(
        builder: (context, state) {
          final homeLocation = PetTrackingCubit.homeLocation;
          final safeZoneRadius = PetTrackingCubit.safeZoneRadius;

          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  initialCenter: homeLocation,
                  initialZoom: 17.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                    subdomains: const ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'com.chauapps.petsafezone',
                  ),
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: homeLocation,
                        radius: safeZoneRadius,
                        useRadiusInMeter: true,
                        color: state.petLocation.isInsideSafeZone
                            ? Colors.green.withValues(alpha: 0.15)
                            : Colors.red.withValues(alpha: 0.15),
                        borderColor: state.petLocation.isInsideSafeZone
                            ? Colors.green
                            : Colors.red,
                        borderStrokeWidth: 2,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 100,
                        height: 100,
                        point: state.petLocation.currentLocation,
                        alignment: Alignment.topCenter,
                        child: CatMarkerWidget(
                          imagePath: 'assets/images/tim.jpeg',
                          markerColor: state.petLocation.isInsideSafeZone
                              ? Colors.blue
                              : Colors.orange,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 16,
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
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up),
                      label: const Text('Announce'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
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
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.home),
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
      ),
    );
  }
}
