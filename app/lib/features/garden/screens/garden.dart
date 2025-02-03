import 'package:app/components/confirm_delete_dialog.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/screens/alerts_tab.dart';
import 'package:app/features/garden/screens/devices_tab.dart';
import 'package:app/features/garden/screens/plants_tab.dart';
import 'package:app/features/garden/widgets/garden_page_header.dart';
import 'package:app/components/title.dart';
import 'package:app/features/garden/widgets/garden_status_bar.dart';
import 'package:app/features/garden/widgets/garden_status_bottom_sheet.dart';
import 'package:app/features/plant/widgets/plant_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GardenPage extends StatefulWidget {
  final String id;

  const GardenPage({required this.id, super.key});

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  late Future<List<dynamic>> futures;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final garden = context.watch<GardenProvider>().getGardenById(widget.id);
    final gardenDeviceReferences =
        context.watch<GardenProvider>().getDevicesByGardenId(widget.id);
    final devicesFuture = context.watch<DeviceProvider>().getDevices();
    // Future.delayed(Duration.zero, () => List<Device>.empty());
    futures = Future.wait([garden, gardenDeviceReferences, devicesFuture]);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("garden ${widget.id} build");

    return Scaffold(
      body: FutureBuilder(
        future: futures,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              debugPrint(snapshot.data.toString());
              final garden = snapshot.data![0] as Garden?;
              final gardenDeviceReferences =
                  snapshot.data![1] as List<DeviceReference>;
              final devices = snapshot.data![2] as List<Device>;
              return Stack(
                children: [
                  _build_loaded(context, garden!),
                  GardenStatusBottomSheet(
                    gardenId: garden.id,
                  ),
                ],
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/gardens/${widget.id}/plants/add"),
        child: Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _build_loaded(BuildContext context, Garden garden) {
    // TODO list can be optimized to set
    if (garden == null) {
      return const Center(child: Text('Garden not found'));
    }

    var tab_bar = TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          text: "Plants",
          icon: Icon(Icons.eco),
        ),
        Tab(
          text: "Devices",
          icon: Icon(Icons.sensors),
        ),
        Tab(
          text: "Alerts",
          icon: Icon(Icons.notifications),
        ),
      ],
    );
    var tab_bar_wrapped = BreakpointContainer(
      padding: EdgeInsets.zero,
      child: Container(
          padding: EdgeInsets.only(bottom: 16.0),
          color: Theme.of(context).colorScheme.surface,
          child: tab_bar),
    );
    var tab_bar_pinned = PinnedHeaderSliver(child: tab_bar_wrapped);

    var tabs = [
      PlantsTab(garden: garden),
      DevicesTab(garden: garden),
      AlertsTab(garden: garden)
    ];

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar.large(
              pinned: true,
              scrolledUnderElevation: 0,
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text(
                garden.name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: GardenPageHeader(garden: garden),
                collapseMode: CollapseMode.pin,
              ),
              expandedHeight: 500,
              surfaceTintColor: Colors.transparent,
              leading: BackButton(
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  elevation: 2.0,
                ),
              ),
              actions: [
                IconButton.filled(
                  onPressed: () {
                    ConfirmDeleteDialog.show(context, "garden ${garden.name}",
                        () {
                      context.read<GardenProvider>().deleteGarden(garden.id);
                      context.go("/");
                    });
                  },
                  icon: Icon(Icons.delete_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    elevation: 2.0,
                  ),
                ),
                SizedBox(width: 8),
                IconButton.filled(
                  onPressed: () => context.go("/gardens/${garden.id}/edit"),
                  icon: Icon(Icons.edit_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    elevation: 2.0,
                  ),
                ),
                SizedBox(width: 8),
              ],
              forceElevated: isScrolled,
              bottom: tab_bar,
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((child) {
          return Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  // sliverFillRemaining
                  // SliverAlignedGrid.count(
                  //   itemBuilder: (context, i) => Container(
                  //     color: Colors.red[100 * ((i % 9) + 1)],
                  //     height: 200,
                  //     child: Center(child: Text(i.toString())),
                  //   ),
                  //   crossAxisCount: 4,
                  //   itemCount: 20,
                  // ),
                  SliverFillRemaining(
                    child: child,
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
