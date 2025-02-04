// Openapi Generator last run: : 2025-02-02T18:46:24.170993

import 'package:app/apis.dart';
import 'package:app/components/dialog_page.dart';
import 'package:app/features/actuators/providers/actuator_provider.dart';
import 'package:app/features/actuators/providers/grpc_actuator_provider.dart';
import 'package:app/features/alerts/providers/alert_provider.dart';
import 'package:app/features/alerts/providers/api_alert_provider.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/providers/grpc_device_provider.dart';
import 'package:app/features/devices/screens/all_devices.dart';
import 'package:app/features/devices/screens/garden_edit_devices.dart';
import 'package:app/features/facts/providers/api_plant_fact_sheet_provider.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/garden/providers/api_garden.provider.dart';
import 'package:app/features/garden/providers/api_garden_images_provider.dart';
import 'package:app/features/garden/providers/garden_images_provider.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/screens/garden_form_dialog.dart';
import 'package:app/features/plant/providers/api_plant_provider.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/features/plant/screens/plant_form_dialog.dart';
import 'package:app/features/garden/screens/garden.dart';
import 'package:app/pages/home.dart';
import 'package:app/features/plant/screens/plant.dart';
import 'package:app/scroll.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:provider/provider.dart';

const String userDataApiBasePath = String.fromEnvironment(
    "USER_DATA_API_BASE_PATH",
    defaultValue: "http://localhost:80/user-data");
const String plantsDbApiBasePath = String.fromEnvironment(
    "PLANTS_DB_API_BASE_PATH",
    defaultValue: "http://localhost:80/plants-db");
const String deviceGrpcHost =
    String.fromEnvironment("DEVICE_GRPC_HOST", defaultValue: "localhost");
const String deviceGrpcPort =
    String.fromEnvironment("DEVICE_GRPC_PORT", defaultValue: "50052");

void main() {
  print("UserDataApiBasePath: $userDataApiBasePath");
  print("PlantsDbApiBasePath: $plantsDbApiBasePath");

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    print(details.toString());
  };

  var userDataApi = UserDataApi.withBasePath(basePath: userDataApiBasePath);
  var plantDbApi = PlantsDBApi.withBasePath(basePath: plantsDbApiBasePath);
  var factsheetProvider = ApiPlantFactSheetProvider(
    api: plantDbApi,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GardenProvider>(
          create: (_) => ApiGardenProvider(
            api: userDataApi,
          ),
        ),
        ChangeNotifierProvider<PlantProvider>(
          create: (_) => ApiPlantProvider(
            api: userDataApi,
          ),
        ),
        ChangeNotifierProvider<PlantFactSheetProvider>(
          create: (_) => factsheetProvider,
        ),
        ChangeNotifierProvider<DeviceProvider>(
          create: (_) => GrpcDeviceProvider(
            host: deviceGrpcHost,
            port: int.parse(deviceGrpcPort),
          ),
        ),
        ChangeNotifierProvider<GardenImagesProvider>(
          create: (_) => ApiGardenImagesProvider(
            userDataApi: userDataApi,
            plantsDbApi: plantDbApi,
          ),
        ),
        ChangeNotifierProvider<ActuatorProvider>(
          create: (_) => GrpcActuatorProvider(
            host: deviceGrpcHost,
            port: int.parse(deviceGrpcPort),
          ),
        ),
        ChangeNotifierProvider<AlertProvider>(
          create: (_) => ApiAlertProvider(
            plantFactSheetProvider: factsheetProvider,
            grpc_host: deviceGrpcHost,
            grpc_port: int.parse(deviceGrpcPort),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

@Openapi(
  inputSpec: InputSpec(path: "../user-data/api/openapi.yml"),
  generatorName: Generator.dart,
  outputDirectory: "lib/gen/user-data-openapi",
)
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: WebWorkingScrollBehavior(),
      title: 'Plant Sense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.rubikTextTheme(),
        // textTheme: GoogleFonts.aboretoTextTheme(),
      ),
      routerConfig: GoRouter(
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              return child;
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
                      pageBuilder: (context, state) => DialogPage(
                        builder: (context) => GardenFormDialog(
                          onGardenSubmitted: (garden) {
                            context.read<GardenProvider>().addGarden(garden);
                          },
                        ),
                      ),
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
                    path: "/edit",
                    pageBuilder: (context, state) {
                      return DialogPage(
                        builder: (context) => GardenFormDialog(
                          gardenId: state.pathParameters['id']!,
                          onGardenSubmitted: (garden) {
                            context.read<GardenProvider>().updateGarden(garden);
                          },
                        ),
                      );
                    },
                  ),
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
                    pageBuilder: (context, state) => DialogPage(
                      builder: (context) => PlantFormDialog(
                        onPlantSubmitted: (plant) {
                          context
                              .read<PlantProvider>()
                              .addPlant(state.pathParameters['id']!, plant);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              GoRoute(
                  path: "/plant/:id",
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: PlantPage(
                          id: state.pathParameters['id']!,
                        ),
                      ),
                  routes: [
                    GoRoute(
                      path: "/edit",
                      pageBuilder: (context, state) {
                        return DialogPage(
                          builder: (context) => PlantFormDialog(
                            // gardenId: state.pathParameters['id']!,
                            plantId: state.pathParameters['id']!,
                            onPlantSubmitted: (plant) {
                              context.read<PlantProvider>().updatePlant(plant);
                            },
                          ),
                        );
                      },
                    ),
                    // GoRoute(
                    //     path: "/history",
                    //     pageBuilder: (context, state) {
                    //       return DialogPage(
                    //         builder: (context) => HistoryPage(),
                    //       );
                    //     })
                  ]),
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
