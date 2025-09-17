part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState({
    required bool isHighContrast,
    required AppThemeConfig themeConfig,
  }) = _ThemeState;

  const ThemeState._();

  factory ThemeState.initial() => ThemeState(
        isHighContrast: false,
        themeConfig: AppThemeConfig.normal(),
      );
}