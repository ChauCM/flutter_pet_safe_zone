import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_state.dart';
import '../widgets/cat_marker_widget.dart';
import '../widgets/map_bottom_bar.dart';
import '../widgets/map_control_buttons.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController;
  DateTime _lastSemanticUpdate = DateTime.now();
  String _semanticLabel = '';

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

          // Update semantic label only every 8 seconds
          final now = DateTime.now();
          if (now.difference(_lastSemanticUpdate).inSeconds >= 8) {
            _lastSemanticUpdate = now;
            _semanticLabel = 'Pet tracking map. Tim is ${state.petLocation.distanceFromHome.round()} '
                'meters from home, ${state.petLocation.isInsideSafeZone ? "inside" : "outside"} '
                'the safe zone.';
          }

          return Stack(
            children: [
              Semantics(
                label: _semanticLabel,
                child: FlutterMap(
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
              const MapControlButtons(),
            ],
          );
        },
      ),
      bottomNavigationBar: MapBottomBar(
        animatedMapController: _animatedMapController,
      ),
    );
  }
}
