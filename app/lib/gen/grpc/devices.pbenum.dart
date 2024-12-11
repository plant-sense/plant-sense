//
//  Generated code. Do not modify.
//  source: devices.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DeviceStatus extends $pb.ProtobufEnum {
  static const DeviceStatus DEVICE_STATUS_UNSPECIFIED = DeviceStatus._(0, _omitEnumNames ? '' : 'DEVICE_STATUS_UNSPECIFIED');
  static const DeviceStatus DEVICE_STATUS_ONLINE = DeviceStatus._(1, _omitEnumNames ? '' : 'DEVICE_STATUS_ONLINE');
  static const DeviceStatus DEVICE_STATUS_OFFLINE = DeviceStatus._(2, _omitEnumNames ? '' : 'DEVICE_STATUS_OFFLINE');
  static const DeviceStatus DEVICE_STATUS_ERROR = DeviceStatus._(3, _omitEnumNames ? '' : 'DEVICE_STATUS_ERROR');

  static const $core.List<DeviceStatus> values = <DeviceStatus> [
    DEVICE_STATUS_UNSPECIFIED,
    DEVICE_STATUS_ONLINE,
    DEVICE_STATUS_OFFLINE,
    DEVICE_STATUS_ERROR,
  ];

  static final $core.Map<$core.int, DeviceStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DeviceStatus? valueOf($core.int value) => _byValue[value];

  const DeviceStatus._($core.int v, $core.String n) : super(v, n);
}

class SensorKind extends $pb.ProtobufEnum {
  static const SensorKind SENSOR_KIND_UNSPECIFIED = SensorKind._(0, _omitEnumNames ? '' : 'SENSOR_KIND_UNSPECIFIED');
  static const SensorKind SENSOR_KIND_TEMPERATURE = SensorKind._(1, _omitEnumNames ? '' : 'SENSOR_KIND_TEMPERATURE');
  static const SensorKind SENSOR_KIND_SOIL_HUMIDITY = SensorKind._(2, _omitEnumNames ? '' : 'SENSOR_KIND_SOIL_HUMIDITY');
  static const SensorKind SENSOR_KIND_LIGHT = SensorKind._(3, _omitEnumNames ? '' : 'SENSOR_KIND_LIGHT');

  static const $core.List<SensorKind> values = <SensorKind> [
    SENSOR_KIND_UNSPECIFIED,
    SENSOR_KIND_TEMPERATURE,
    SENSOR_KIND_SOIL_HUMIDITY,
    SENSOR_KIND_LIGHT,
  ];

  static final $core.Map<$core.int, SensorKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SensorKind? valueOf($core.int value) => _byValue[value];

  const SensorKind._($core.int v, $core.String n) : super(v, n);
}

class ActuatorKind extends $pb.ProtobufEnum {
  static const ActuatorKind ACTUATOR_KIND_UNSPECIFIED = ActuatorKind._(0, _omitEnumNames ? '' : 'ACTUATOR_KIND_UNSPECIFIED');
  static const ActuatorKind ACTUATOR_KIND_LIGHT = ActuatorKind._(1, _omitEnumNames ? '' : 'ACTUATOR_KIND_LIGHT');
  static const ActuatorKind ACTUATOR_KIND_OUTLET = ActuatorKind._(2, _omitEnumNames ? '' : 'ACTUATOR_KIND_OUTLET');
  static const ActuatorKind ACTUATOR_KIND_IRRIGATION = ActuatorKind._(3, _omitEnumNames ? '' : 'ACTUATOR_KIND_IRRIGATION');

  static const $core.List<ActuatorKind> values = <ActuatorKind> [
    ACTUATOR_KIND_UNSPECIFIED,
    ACTUATOR_KIND_LIGHT,
    ACTUATOR_KIND_OUTLET,
    ACTUATOR_KIND_IRRIGATION,
  ];

  static final $core.Map<$core.int, ActuatorKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ActuatorKind? valueOf($core.int value) => _byValue[value];

  const ActuatorKind._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
