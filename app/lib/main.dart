// Openapi Generator last run: : 2024-12-29T16:32:54.482226
import 'package:app/apis.dart';
import 'package:app/app_scaffold.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/providers/grpc_device_provider.dart';
import 'package:app/components/modal_bottom_sheet_page.dart';
import 'package:app/features/devices/screens/all_devices.dart';
import 'package:app/features/devices/widgets/garden_edit_devices_sheet.dart';
import 'package:app/features/facts/providers/api_plant_fact_sheet_provider.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/garden/providers/api_garden.provider.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/widgets/garden_add_sheet.dart';
import 'package:app/features/plant/providers/api_plant_provider.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/features/plant/widgets/plant_add_sheet.dart';
import 'package:app/features/garden/screens/garden.dart';
import 'package:app/pages/home.dart';
import 'package:app/features/plant/screens/plant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:provider/provider.dart';

const String userDataApiBasePath = String.fromEnvironment(
    "USER_DATA_API_BASE_PATH",
    defaultValue: "http://localhost:9090");
const String plantsDbApiBasePath = String.fromEnvironment(
    "PLANTS_DB_API_BASE_PATH",
    defaultValue: "http://localhost:8080");
const String deviceGrpcHost =
    String.fromEnvironment("DEVICE_GRPC_HOST", defaultValue: "localhost");
const String deviceGrpcPort =
    String.fromEnvironment("DEVICE_GRPC_PORT", defaultValue: "50052");

void main() {
  var userDataApi = UserDataApi.withBasePath(basePath: userDataApiBasePath);
  var plantDbApi = PlantsDBApi.withBasePath(basePath: plantsDbApiBasePath);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GardenProvider>(
          create: (_) => ApiGardenProvider(api: userDataApi),
        ),
        ChangeNotifierProvider<PlantProvider>(
          create: (_) => ApiPlantProvider(api: userDataApi),
        ),
        ChangeNotifierProvider<PlantFactSheetProvider>(
          create: (_) => ApiPlantFactSheetProvider(api: plantDbApi),
        ),
        ChangeNotifierProvider<DeviceProvider>(
          create: (_) => GrpcDeviceProvider(
              host: deviceGrpcHost, port: int.parse(deviceGrpcPort)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

@Openapi(
  inputSpec: InputSpec(path: "../user-data/api/openapi.yml"),
  generatorName: Generator.dart,
  outputDirectory: "lib/gen/openapi",
)
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
                      pageBuilder: (context, state) =>
                          NoTransitionPage(child: AllDevices()),
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
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: GardenEditDevices(
                        gardenId: state.pathParameters['id']!,
                      ),
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

@Openapi(
  inputSpec: InputSpec(path: "../plants-db/api/openapi.yml"),
  generatorName: Generator.dart,
  outputDirectory: "lib/gen/plants-db-openapi",
)
class _Placeholder extends StatelessWidget {
  const _Placeholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}