//
//  Generated code. Do not modify.
//  source: devices.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deviceStatusDescriptor instead')
const DeviceStatus$json = {
  '1': 'DeviceStatus',
  '2': [
    {'1': 'DEVICE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'DEVICE_STATUS_ONLINE', '2': 1},
    {'1': 'DEVICE_STATUS_OFFLINE', '2': 2},
    {'1': 'DEVICE_STATUS_ERROR', '2': 3},
  ],
};

/// Descriptor for `DeviceStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceStatusDescriptor = $convert.base64Decode(
    'CgxEZXZpY2VTdGF0dXMSHQoZREVWSUNFX1NUQVRVU19VTlNQRUNJRklFRBAAEhgKFERFVklDRV'
    '9TVEFUVVNfT05MSU5FEAESGQoVREVWSUNFX1NUQVRVU19PRkZMSU5FEAISFwoTREVWSUNFX1NU'
    'QVRVU19FUlJPUhAD');

@$core.Deprecated('Use sensorKindDescriptor instead')
const SensorKind$json = {
  '1': 'SensorKind',
  '2': [
    {'1': 'SENSOR_KIND_UNSPECIFIED', '2': 0},
    {'1': 'SENSOR_KIND_TEMPERATURE', '2': 1},
    {'1': 'SENSOR_KIND_SOIL_HUMIDITY', '2': 2},
    {'1': 'SENSOR_KIND_LIGHT', '2': 3},
  ],
};

/// Descriptor for `SensorKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sensorKindDescriptor = $convert.base64Decode(
    'CgpTZW5zb3JLaW5kEhsKF1NFTlNPUl9LSU5EX1VOU1BFQ0lGSUVEEAASGwoXU0VOU09SX0tJTk'
    'RfVEVNUEVSQVRVUkUQARIdChlTRU5TT1JfS0lORF9TT0lMX0hVTUlESVRZEAISFQoRU0VOU09S'
    'X0tJTkRfTElHSFQQAw==');

@$core.Deprecated('Use actuatorKindDescriptor instead')
const ActuatorKind$json = {
  '1': 'ActuatorKind',
  '2': [
    {'1': 'ACTUATOR_KIND_UNSPECIFIED', '2': 0},
    {'1': 'ACTUATOR_KIND_LIGHT', '2': 1},
    {'1': 'ACTUATOR_KIND_OUTLET', '2': 2},
    {'1': 'ACTUATOR_KIND_IRRIGATION', '2': 3},
  ],
};

/// Descriptor for `ActuatorKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List actuatorKindDescriptor = $convert.base64Decode(
    'CgxBY3R1YXRvcktpbmQSHQoZQUNUVUFUT1JfS0lORF9VTlNQRUNJRklFRBAAEhcKE0FDVFVBVE'
    '9SX0tJTkRfTElHSFQQARIYChRBQ1RVQVRPUl9LSU5EX09VVExFVBACEhwKGEFDVFVBVE9SX0tJ'
    'TkRfSVJSSUdBVElPThAD');

@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = {
  '1': 'Device',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.plant_sense.internal.DeviceStatus', '10': 'status'},
    {'1': 'type', '3': 3, '4': 1, '5': 11, '6': '.plant_sense.internal.DeviceType', '10': 'type'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USDgoCaWQYASABKAlSAmlkEjoKBnN0YXR1cxgCIAEoDjIiLnBsYW50X3NlbnNlLm'
    'ludGVybmFsLkRldmljZVN0YXR1c1IGc3RhdHVzEjQKBHR5cGUYAyABKAsyIC5wbGFudF9zZW5z'
    'ZS5pbnRlcm5hbC5EZXZpY2VUeXBlUgR0eXBl');

@$core.Deprecated('Use deviceTypeDescriptor instead')
const DeviceType$json = {
  '1': 'DeviceType',
  '2': [
    {'1': 'sensor', '3': 1, '4': 1, '5': 14, '6': '.plant_sense.internal.SensorKind', '9': 0, '10': 'sensor'},
    {'1': 'actuator', '3': 2, '4': 1, '5': 14, '6': '.plant_sense.internal.ActuatorKind', '9': 0, '10': 'actuator'},
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `DeviceType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceTypeDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VUeXBlEjoKBnNlbnNvchgBIAEoDjIgLnBsYW50X3NlbnNlLmludGVybmFsLlNlbn'
    'NvcktpbmRIAFIGc2Vuc29yEkAKCGFjdHVhdG9yGAIgASgOMiIucGxhbnRfc2Vuc2UuaW50ZXJu'
    'YWwuQWN0dWF0b3JLaW5kSABSCGFjdHVhdG9yQgYKBHR5cGU=');

@$core.Deprecated('Use getDeviceRequestDescriptor instead')
const GetDeviceRequest$json = {
  '1': 'GetDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeviceRequestDescriptor = $convert.base64Decode(
    'ChBHZXREZXZpY2VSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use listDevicesRequestDescriptor instead')
const ListDevicesRequest$json = {
  '1': 'ListDevicesRequest',
};

/// Descriptor for `ListDevicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDevicesRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0RGV2aWNlc1JlcXVlc3Q=');

@$core.Deprecated('Use listDevicesResponseDescriptor instead')
const ListDevicesResponse$json = {
  '1': 'ListDevicesResponse',
  '2': [
    {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.plant_sense.internal.Device', '10': 'devices'},
  ],
};

/// Descriptor for `ListDevicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDevicesResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0RGV2aWNlc1Jlc3BvbnNlEjYKB2RldmljZXMYASADKAsyHC5wbGFudF9zZW5zZS5pbn'
    'Rlcm5hbC5EZXZpY2VSB2RldmljZXM=');

