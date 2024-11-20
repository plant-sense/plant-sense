import 'package:app/app_scaffold.dart';
import 'package:app/features/facts/providers/mock_plant_fact_sheet_provider.dart';
import 'package:app/features/garden/providers/mock_garden_provider.dart';
import 'package:app/features/plant/providers/mock_plant_provider.dart';
import 'package:app/pages/details.dart';
import 'package:app/features/garden/screens/garden.dart';
import 'package:app/pages/home.dart';
import 'package:app/features/plant/screens/plant.dart';
import 'package:app/pages/plant_gauges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MockGardenProvider()),
        ChangeNotifierProvider(create: (_) => MockPlantProvider()),
        ChangeNotifierProvider(create: (_) => MockPlantFactSheetProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Plant Sense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
        textTheme: GoogleFonts.aboretoTextTheme(),
      ),
      routerConfig: GoRouter(
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              return AppScaffold(child: child);
            },
            routes: [
              GoRoute(
                path: "/home",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: HomePage(),
                ),
              ),
              GoRoute(
                path: "/gauges",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: PlantGaugesPage(title: "Plant [details]"),
                ),
              ),
              GoRoute(
                path: "/details/:id",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DetailsPage(
                    id: state.pathParameters['id']!,
                  ),
                ),
              ),
              GoRoute(
                path: "/gardens/:id",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: GardenPage(
                    id: state.pathParameters['id']!,
                  ),
                ),
              ),
              GoRoute(
                path: "/plant/:id",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: PlantPage(
                    id: state.pathParameters['id']!,
                  ),
                ),
              ),
            ],
          ),
        ],
        initialLocation: "/home",
      ),
    );
  }
}
