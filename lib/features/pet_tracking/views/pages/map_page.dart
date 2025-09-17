import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_state.dart';
import '../widgets/cat_marker_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController;

  @override
  void initState() {
    super.initState();
    _animatedMapController = AnimatedMapController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animatedMapController.dispose();
    super.dispose();
  }

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
                mapController: _animatedMapController.mapController,
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
              // Distance indicator
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: state.petLocation.isInsideSafeZone
                        ? Colors.green
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Tim is ${state.petLocation.distanceFromHome.toInt()}m from home',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              // Control buttons
              Positioned(
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
                onPressed: () {
                  final currentLocation = context
                      .read<PetTrackingCubit>()
                      .state
                      .petLocation
                      .currentLocation;
                  _animatedMapController.animateTo(
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
      ),
    );
  }
}
