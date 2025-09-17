import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../common/blocs/theme_cubit/theme_cubit.dart';
import '../../../common/widgets/styled_snackbar.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import '../../blocs/pet_tracking_cubit/pet_tracking_state.dart';
import '../widgets/cat_marker_widget.dart';
import '../widgets/keyboard_guide_dialog.dart';
import '../widgets/map_bottom_bar.dart';
import '../widgets/map_control_buttons.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController;
  late final FlutterTts _flutterTts;
  DateTime _lastSemanticUpdate = DateTime.now();
  String _semanticLabel = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animatedMapController = AnimatedMapController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    _flutterTts = FlutterTts();
    _setupTts();
  }

  Future<void> _setupTts() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(1);
  }

  @override
  void dispose() {
    _animatedMapController.dispose();
    _flutterTts.stop();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return;

    final key = event.logicalKey;
    final petTrackingCubit = context.read<PetTrackingCubit>();
    final themeCubit = context.read<ThemeCubit>();

    if (key == LogicalKeyboardKey.keyH) {
      themeCubit.toggleHighContrast();
      StyledSnackBar.show(
        context: context,
        message:
            'High contrast ${themeCubit.state.isHighContrast ? "enabled" : "disabled"}',
        icon: Icons.contrast,
      );
    } else if (key == LogicalKeyboardKey.keyA) {
      petTrackingCubit.toggleAnnounce();
      StyledSnackBar.show(
        context: context,
        message:
            'Voice announcements ${petTrackingCubit.state.isAnnounceEnabled ? "enabled" : "disabled"}',
        icon: petTrackingCubit.state.isAnnounceEnabled
            ? Icons.volume_up
            : Icons.volume_off,
      );
    } else if (key == LogicalKeyboardKey.keyK) {
      KeyboardGuideDialog.show(context);
    } else if (key == LogicalKeyboardKey.keyR) {
      petTrackingCubit.restart();
      _animatedMapController.animateTo(
        dest: PetTrackingCubit.homeLocation,
        zoom: 17.0,
      );
      StyledSnackBar.show(
        context: context,
        message: 'Tracking restarted',
        icon: Icons.refresh,
      );
    } else if (key == LogicalKeyboardKey.space) {
      final currentLocation =
          petTrackingCubit.state.petLocation.currentLocation;
      _animatedMapController.animateTo(dest: currentLocation, zoom: 17.0);
      StyledSnackBar.show(
        context: context,
        message: 'Map centered on Tim',
        icon: Icons.pets,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      autofocus: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('🐾 Tim Safe Zone Tracker'),
          centerTitle: true,
        ),
        body: MultiBlocListener(
          listeners: [
            // Listener for safe zone alerts (in/out)
            BlocListener<PetTrackingCubit, PetTrackingState>(
              listenWhen: (previous, current) {
                // Only listen when announce is enabled and zone status changes
                if (!current.isAnnounceEnabled) {
                  return false;
                }
                return previous.petLocation.isInsideSafeZone !=
                    current.petLocation.isInsideSafeZone;
              },
              listener: (context, state) async {
                final isInSafeZone = state.petLocation.isInsideSafeZone;
                await _flutterTts.stop();
                if (isInSafeZone) {
                  _flutterTts.speak(
                    'Good news: Tim has returned to the safe zone',
                  );
                } else {
                  _flutterTts.speak('Alert: Tim has left the safe zone!');
                }
              },
            ),
            // Listener for distance announcements (every 50m)
            BlocListener<PetTrackingCubit, PetTrackingState>(
              listenWhen: (previous, current) {
                if (!current.isAnnounceEnabled) return false;

                final prevBucket = previous.petLocation.fiftyMBucket;
                final currBucket = current.petLocation.fiftyMBucket;
                return prevBucket != currBucket;
              },
              listener: (context, state) {
                final bucket = state.petLocation.fiftyMBucket;

                _flutterTts.speak(
                  bucket == 0
                      ? 'Tim is at home'
                      : 'Tim is $bucket meters from home',
                );
              },
            ),
          ],
          child: BlocBuilder<PetTrackingCubit, PetTrackingState>(
            builder: (context, state) {
              final theme = context.watch<ThemeCubit>().state.themeConfig;
              final homeLocation = PetTrackingCubit.homeLocation;
              final safeZoneRadius = PetTrackingCubit.safeZoneRadius;

              // Update semantic label only every 8 seconds
              final now = DateTime.now();
              if (now.difference(_lastSemanticUpdate).inSeconds >= 8) {
                _lastSemanticUpdate = now;
                _semanticLabel =
                    'Pet tracking map. Tim is ${state.petLocation.distanceFromHome.round()} '
                    'meters from home, ${state.petLocation.isInsideSafeZone ? "inside" : "outside"} '
                    'the safe zone.';
              }

              return Stack(
                children: [
                  Semantics(
                    label: _semanticLabel,
                    sortKey: const OrdinalSortKey(2),
                    child: FlutterMap(
                      mapController: _animatedMapController.mapController,
                      options: MapOptions(
                        initialCenter: homeLocation,
                        initialZoom: 17.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: theme.mapTileUrl,
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
                                  ? theme.safeZoneFillColor
                                  : theme.dangerZoneFillColor,
                              borderColor: state.petLocation.isInsideSafeZone
                                  ? theme.safeZoneBorderColor
                                  : theme.dangerZoneBorderColor,
                              borderStrokeWidth: theme.zoneBorderWidth,
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
                                    ? theme.petMarkerColorSafe
                                    : theme.petMarkerColorDanger,
                                width: 100,
                                height: 100,
                                isInsideSafeZone:
                                    state.petLocation.isInsideSafeZone,
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
                    child: Semantics(
                      sortKey: const OrdinalSortKey(0),
                      container: true,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: state.petLocation.isInsideSafeZone
                              ? theme.distanceIndicatorColorSafe
                              : theme.distanceIndicatorColorDanger,
                          borderRadius: BorderRadius.circular(20),
                          border: theme.distanceIndicatorBorder,
                        ),
                        child: Text(
                          'Tim is ${state.petLocation.distanceFromHome.toInt()}m from home',
                          style: TextStyle(
                            color: theme.distanceIndicatorTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: theme.distanceIndicatorFontSize,
                          ),
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
        ),
        bottomNavigationBar: MapBottomBar(
          animatedMapController: _animatedMapController,
        ),
      ),
    );
  }
}
