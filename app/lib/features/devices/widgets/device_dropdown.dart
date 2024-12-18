import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceDropdown extends StatefulWidget {
  final bool Function(Device) predicate;
  final Device? current;
  final void Function(Device)? onDeviceChanged;
  final ValueNotifier<Device?>? controller;
  final bool additionalFormatting;
  final List<Device> devices;

  const DeviceDropdown({
    super.key,
    required this.predicate,
    this.current,
    this.onDeviceChanged,
    this.additionalFormatting = false,
    this.controller,
    required this.devices,
  });

  @override
  State<DeviceDropdown> createState() => _DeviceDropdownState();
}

class _DeviceDropdownState extends State<DeviceDropdown> {
  Device? selectedDevice;

  @override
  void initState() {
    super.initState();
    selectedDevice = widget.controller?.value ?? widget.current;
    widget.controller?.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted && selectedDevice != widget.controller?.value) {
      setState(() => selectedDevice = widget.controller?.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    var filteredDevices = widget.devices.where(widget.predicate).toList();
    // var filteredDevices = context
    //     .watch<DeviceProvider>()
    //     .devices
    //     .where(widget.predicate)
    //     .toList();

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
          widget.controller?.value = newDevice;
          widget.onDeviceChanged?.call(newDevice);
        }
      },
    );
  }
}
