import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/app_theme_config.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void toggleHighContrast() {
    final newIsHighContrast = !state.isHighContrast;
    final newThemeConfig = newIsHighContrast
        ? AppThemeConfig.highContrast()
        : AppThemeConfig.normal();

    emit(state.copyWith(
      isHighContrast: newIsHighContrast,
      themeConfig: newThemeConfig,
    ));
  }
}