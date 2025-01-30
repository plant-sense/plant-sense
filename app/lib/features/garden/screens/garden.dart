import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/widgets/garden_page_header.dart';
import 'package:app/components/title.dart';
import 'package:app/features/garden/widgets/garden_status_bar.dart';
import 'package:app/features/plant/widgets/plant_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GardenPage extends StatefulWidget {
  final String id;

  const GardenPage({required this.id, super.key});

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> {
  late Future<List<dynamic>> futures;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint("garden ${widget.id} didChangeDependencies");
    super.didChangeDependencies();
    final garden = context.watch<GardenProvider>().getGardenById(widget.id);
    final gardenDeviceReferences =
        context.watch<GardenProvider>().getDevicesByGardenId(widget.id);
    final devicesFuture = context.watch<DeviceProvider>().getDevices();
    // final devicesFuture =
    //     Future.delayed(Duration.zero, () => List<Device>.empty());
    futures = Future.wait([garden, gardenDeviceReferences, devicesFuture]);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("garden ${widget.id} build");

    return Scaffold(
      body: SingleChildScrollView(
        // child: GardenPageContent(id: widget.id),
        child: FutureBuilder(
          future: futures,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              default:
                final garden = snapshot.data![0] as Garden?;
                final gardenDeviceReferences =
                    snapshot.data![1] as List<DeviceReference>;
                final devices = snapshot.data![2] as List<Device>;
                return _build_loaded(
                    context, garden!, gardenDeviceReferences, devices);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/gardens/${widget.id}/plants/add"),
        child: Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _build_loaded(
    BuildContext context,
    Garden garden,
    List<DeviceReference> gardenDeviceReferences,
    List<Device> devices_in_garden,
  ) {
    // TODO list can be optimized to set
    if (garden == null) {
      return const Center(child: Text('Garden not found'));
    }
    return Column(
      children: [
        GardenPageHeader(garden: garden!),
        BreakpointContainer(
          child: GardenStatusBar(devices_in_garden: devices_in_garden),
        ),
        BreakpointContainer(
          child: TitleText(title: "Plants"),
        ),
        BreakpointContainer(
          child: PlantCardGrid(
            gardenId: garden!.id,
          ),
        )
      ],
    );
  }
}
