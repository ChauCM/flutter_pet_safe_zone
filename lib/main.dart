import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => PetTrackingCubit(),
      child: MaterialApp(
        title: 'Pet Safe Zone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const MapPage(),
      ),
    );
  }
}
