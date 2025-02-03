import 'package:app/components/grabber.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/widgets/garden_status_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GardenStatusBottomSheet extends StatefulWidget {
  final String gardenId;

  const GardenStatusBottomSheet({super.key, required this.gardenId});
  @override
  State<GardenStatusBottomSheet> createState() =>
      _GardenStatusBottomSheetState();
}

class _GardenStatusBottomSheetState extends State<GardenStatusBottomSheet> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();

  double _sheetPosition = 0.15;
  final double _dragSensitivity = 1000;
  final double _maxChildSize = 0.8;
  final double _minChildSize = 0.05;

  late Future<dynamic> futures;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final gardenDeviceReferences =
        context.watch<GardenProvider>().getDevicesByGardenId(widget.gardenId);
    final devicesFuture = context.watch<DeviceProvider>().getDevices();
    futures = Future.wait([gardenDeviceReferences, devicesFuture]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return DraggableScrollableSheet(
        controller: _controller,
        minChildSize: _minChildSize,
        initialChildSize: _sheetPosition,
        maxChildSize: _maxChildSize,
        snap: true,
        snapSizes: [
          _minChildSize,
          (_minChildSize + _maxChildSize) / 2,
          _maxChildSize,
        ],
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: theme.surfaceContainerLow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Grabber(
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _sheetPosition -=
                          details.delta.dy / MediaQuery.of(context).size.height;
                      if (_sheetPosition < _minChildSize) {
                        _sheetPosition = _minChildSize;
                      }
                      if (_sheetPosition > 1.0) {
                        _sheetPosition = 1.0;
                      }
                      if (_sheetPosition >= _maxChildSize) {
                        _sheetPosition = _maxChildSize;
                      }
                    });
                  },
                  isOnDesktopAndWeb: _isOnDesktopAndWeb,
                ),
                Flexible(
                  child: FutureBuilder(
                    future: futures,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          final gardenDeviceReferences =
                              snapshot.data![0] as List<DeviceReference>;
                          final devices = snapshot.data![1] as List<Device>;

                          final devices_in_garden = devices
                              .where((d) => gardenDeviceReferences
                                  .any((deviceRef) => d.id == deviceRef.id))
                              .toList();

                          return SingleChildScrollView(
                            child: GardenStatusBar(
                              devices_in_garden: devices_in_garden,
                            ),
                          );
                        default:
                          return const Center(
                              child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}
