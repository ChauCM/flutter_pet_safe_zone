import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_config.freezed.dart';

@freezed
sealed class AppThemeConfig with _$AppThemeConfig {
  const factory AppThemeConfig({
    required String mapTileUrl,
    required Color safeZoneColor,
    required Color dangerZoneColor,
    required Color safeZoneFillColor,
    required Color dangerZoneFillColor,
    required Color safeZoneBorderColor,
    required Color dangerZoneBorderColor,
    required double zoneBorderWidth,
    required Color petMarkerColorSafe,
    required Color petMarkerColorDanger,
    required Color distanceIndicatorColorSafe,
    required Color distanceIndicatorColorDanger,
    required Color distanceIndicatorTextColor,
    required double distanceIndicatorFontSize,
    required Color activeButtonBackgroundColor,
    required Color activeButtonForegroundColor,
    required BorderSide? buttonBorderSide,
    required BoxBorder? distanceIndicatorBorder,
    required ThemeData materialTheme,
  }) = _AppThemeConfig;

  const AppThemeConfig._();

  factory AppThemeConfig.normal() => AppThemeConfig(
    mapTileUrl:
        'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
    safeZoneColor: Colors.green,
    dangerZoneColor: Colors.red,
    safeZoneFillColor: Colors.green.withValues(alpha: 0.15),
    dangerZoneFillColor: Colors.red.withValues(alpha: 0.15),
    safeZoneBorderColor: Colors.green,
    dangerZoneBorderColor: Colors.red,
    zoneBorderWidth: 2,
    petMarkerColorSafe: Colors.blue,
    petMarkerColorDanger: Colors.orange,
    distanceIndicatorColorSafe: Colors.green,
    distanceIndicatorColorDanger: Colors.orange,
    distanceIndicatorTextColor: Colors.white,
    distanceIndicatorFontSize: 16,
    activeButtonBackgroundColor: Colors.green,
    activeButtonForegroundColor: Colors.white,
    buttonBorderSide: null,
    distanceIndicatorBorder: null,
    materialTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(minimumSize: const Size(100, 48)),
      ),
    ),
  );

  factory AppThemeConfig.highContrast() => AppThemeConfig(
    mapTileUrl: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
    safeZoneColor: Colors.green,
    dangerZoneColor: Colors.red,
    safeZoneFillColor: Colors.green.withValues(alpha: 0.5),
    dangerZoneFillColor: Colors.red.withValues(alpha: 0.5),
    safeZoneBorderColor: Colors.lightGreen,
    dangerZoneBorderColor: Colors.orange,
    zoneBorderWidth: 6,
    petMarkerColorSafe: Colors.lightBlue,
    petMarkerColorDanger: Colors.orange,
    distanceIndicatorColorSafe: Colors.lightGreen,
    distanceIndicatorColorDanger: Colors.orange,
    distanceIndicatorTextColor: Colors.white,
    distanceIndicatorFontSize: 18,
    activeButtonBackgroundColor: Colors.black,
    activeButtonForegroundColor: Colors.white,
    buttonBorderSide: const BorderSide(color: Colors.white, width: 2),
    distanceIndicatorBorder: Border.all(color: Colors.white, width: 2),
    materialTheme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.highContrastLight(
        primary: Colors.black,
        secondary: Colors.black,
        surface: Colors.white,
        error: Colors.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 48),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 24),
      useMaterial3: true,
    ),
  );
}
