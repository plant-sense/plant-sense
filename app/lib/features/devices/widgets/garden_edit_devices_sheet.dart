import 'package:app/components/title.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:app/features/devices/widgets/garden_device_list.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/providers/mock_garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GardenEditDevices extends StatelessWidget {
  final String gardenId;

  const GardenEditDevices({super.key, required this.gardenId});

  @override
  Widget build(BuildContext context) {
    var gardenProvider = Provider.of<GardenProvider>(context);
    var garden = Provider.of<GardenProvider>(context).getGardenById(gardenId);
    var devicesInGarden = garden!.allDevices();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GardenDeviceList(
          gardenId: gardenId,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: TitleText(title: "Connect new devices"),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: ,
            children: [
              DeviceDropdown(
                predicate: (p) =>
                    !devicesInGarden.contains(p.id) &&
                    !garden.sensors.containsKey(p.deviceType),
                additionalFormatting: true,
              ),
              SizedBox(width: 16),
              FilledButton.icon(
                onPressed: () {
                  // TODO
                },
                label: Text("Connect"),
                icon: Icon(Icons.add),
              )
            ],
          ),
        )
      ],
    );
  }
}
