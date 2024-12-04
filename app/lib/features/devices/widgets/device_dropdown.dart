import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceDropdown extends StatefulWidget {
  final bool Function(Device) predicate;
  final Device? current;
  final void Function(Device)? onDeviceChanged;
  // final Widget Function(Device)? builder;
  final bool additionalFormatting;

  const DeviceDropdown({
    required this.predicate,
    this.current,
    this.onDeviceChanged,
    // this.builder,
    this.additionalFormatting = false,
  });

  @override
  State<DeviceDropdown> createState() => _DeviceDropdownState();
}

class _DeviceDropdownState extends State<DeviceDropdown> {
  Device? selectedDevice;

  // Widget Function(Device) get _builder =>
  //     widget.builder ?? ((device) => Text(device.id));

  @override
  void initState() {
    super.initState();
    selectedDevice = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    var filteredDevices =
        Provider.of<DeviceProvider>(context).devices.where(widget.predicate);

    return DropdownMenu<Device>(
      initialSelection: selectedDevice,
      requestFocusOnTap: true,
      leadingIcon: widget.additionalFormatting && selectedDevice != null
          ? DeviceIcon(type: selectedDevice!.deviceType)
          : null,
      hintText: 'Select a device',
      label: widget.additionalFormatting && selectedDevice != null
          ? Text(selectedDevice!.deviceType.toString())
          : null,
      dropdownMenuEntries: filteredDevices
          .map(
            (device) => DropdownMenuEntry(
              value: device,
              leadingIcon: widget.additionalFormatting
                  ? DeviceIcon(type: device.deviceType)
                  : null,
              label: device.id,
              labelWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(device.id),
                  ...?widget.additionalFormatting
                      ? [Text(device.deviceType.toString())]
                      : null,
                ],
              ),
            ),
          )
          .toList(),
      onSelected: (Device? newDevice) {
        setState(() => selectedDevice = newDevice);
        if (newDevice != null) {
          widget.onDeviceChanged?.call(newDevice);
        }
      },
    );
  }
}
