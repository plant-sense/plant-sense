import 'package:app/app_scaffold.dart';
import 'package:app/pages/details.dart';
import 'package:app/pages/garden.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/plant.dart';
import 'package:app/pages/plant_gauges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
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
