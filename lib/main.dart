import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pet_safe_zone/features/common/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_pet_safe_zone/features/pet_tracking/blocs/pet_tracking_cubit/pet_tracking_cubit.dart';
import 'package:flutter_pet_safe_zone/features/pet_tracking/views/pages/map_page.dart';

void main() {
  runApp(const MyApp());
  SemanticsBinding.instance.ensureSemantics();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => PetTrackingCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Pet Safe Zone',
            theme: themeState.themeConfig.materialTheme,
            home: const MapPage(),
          );
        },
      ),
    );
  }
}
