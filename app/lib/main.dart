import 'package:app/app_scaffold.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/providers/mock_device_provider.dart';
import 'package:app/components/modal_bottom_sheet_page.dart';
import 'package:app/features/devices/screens/all_devices.dart';
import 'package:app/features/devices/widgets/garden_edit_devices_sheet.dart';
import 'package:app/features/facts/providers/mock_plant_fact_sheet_provider.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/providers/mock_garden_provider.dart';
import 'package:app/features/garden/widgets/garden_add_sheet.dart';
import 'package:app/features/plant/providers/mock_plant_provider.dart';
import 'package:app/features/plant/widgets/plant_add_sheet.dart';
import 'package:app/features/garden/screens/garden.dart';
import 'package:app/pages/home.dart';
import 'package:app/features/plant/screens/plant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// @Openapi(
//   inputSpec: InputSpec(path: "../../plants-db/api/openapi.yml"),
//   generatorName: Generator.dart,
//   outputDirectory: "lib/gen/openapi",
// )
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GardenProvider>(
          create: (_) => MockGardenProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MockPlantProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MockPlantFactSheetProvider(),
        ),
        ChangeNotifierProvider<DeviceProvider>(
          create: (_) => MockDeviceProvider(),
        ),
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
                  path: "/",
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: HomePage(),
                      ),
                  routes: [
                    GoRoute(
                      path: "/gardens/add",
                      pageBuilder: (context, state) => ModalBottomSheetPage(
                          builder: (context) => GardenAddSheet()),
                    ),
                    GoRoute(
                      path: "/devices",
                      pageBuilder: (context, state) => ModalBottomSheetPage(
                        builder: (context) => AllDevices(),
                      ),
                    )
                  ]),
              GoRoute(
                path: "/gardens/:id",
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: GardenPage(
                      id: state.pathParameters['id']!,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: "/devices",
                    pageBuilder: (context, state) => ModalBottomSheetPage(
                      builder: (context) => GardenEditDevices(
                          gardenId: state.pathParameters['id']!),
                    ),
                  ),
                  GoRoute(
                      path: "/plants/add",
                      pageBuilder: (context, state) {
                        return ModalBottomSheetPage(
                            builder: (context) => PlantAddSheet(
                                  gardenId: state.pathParameters['id']!,
                                ));
                      }),
                ],
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
        initialLocation: "/",
      ),
    );
  }
}
