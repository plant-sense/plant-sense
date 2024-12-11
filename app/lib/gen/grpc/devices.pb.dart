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

import 'devices.pbenum.dart';

export 'devices.pbenum.dart';

class Device extends $pb.GeneratedMessage {
  factory Device({
    $core.String? id,
    DeviceStatus? status,
    DeviceType? type,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (status != null) {
      $result.status = status;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  Device._() : super();
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Device', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<DeviceStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: DeviceStatus.DEVICE_STATUS_UNSPECIFIED, valueOf: DeviceStatus.valueOf, enumValues: DeviceStatus.values)
    ..aOM<DeviceType>(3, _omitFieldNames ? '' : 'type', subBuilder: DeviceType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  DeviceStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(DeviceStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  DeviceType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(DeviceType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
  @$pb.TagNumber(3)
  DeviceType ensureType() => $_ensure(2);
}

enum DeviceType_Type {
  sensor, 
  actuator, 
  notSet
}

class DeviceType extends $pb.GeneratedMessage {
  factory DeviceType({
    SensorKind? sensor,
    ActuatorKind? actuator,
  }) {
    final $result = create();
    if (sensor != null) {
      $result.sensor = sensor;
    }
    if (actuator != null) {
      $result.actuator = actuator;
    }
    return $result;
  }
  DeviceType._() : super();
  factory DeviceType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DeviceType_Type> _DeviceType_TypeByTag = {
    1 : DeviceType_Type.sensor,
    2 : DeviceType_Type.actuator,
    0 : DeviceType_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceType', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<SensorKind>(1, _omitFieldNames ? '' : 'sensor', $pb.PbFieldType.OE, defaultOrMaker: SensorKind.SENSOR_KIND_UNSPECIFIED, valueOf: SensorKind.valueOf, enumValues: SensorKind.values)
    ..e<ActuatorKind>(2, _omitFieldNames ? '' : 'actuator', $pb.PbFieldType.OE, defaultOrMaker: ActuatorKind.ACTUATOR_KIND_UNSPECIFIED, valueOf: ActuatorKind.valueOf, enumValues: ActuatorKind.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceType clone() => DeviceType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceType copyWith(void Function(DeviceType) updates) => super.copyWith((message) => updates(message as DeviceType)) as DeviceType;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceType create() => DeviceType._();
  DeviceType createEmptyInstance() => create();
  static $pb.PbList<DeviceType> createRepeated() => $pb.PbList<DeviceType>();
  @$core.pragma('dart2js:noInline')
  static DeviceType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceType>(create);
  static DeviceType? _defaultInstance;

  DeviceType_Type whichType() => _DeviceType_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SensorKind get sensor => $_getN(0);
  @$pb.TagNumber(1)
  set sensor(SensorKind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSensor() => $_has(0);
  @$pb.TagNumber(1)
  void clearSensor() => clearField(1);

  @$pb.TagNumber(2)
  ActuatorKind get actuator => $_getN(1);
  @$pb.TagNumber(2)
  set actuator(ActuatorKind v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasActuator() => $_has(1);
  @$pb.TagNumber(2)
  void clearActuator() => clearField(2);
}

class GetDeviceRequest extends $pb.GeneratedMessage {
  factory GetDeviceRequest({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  GetDeviceRequest._() : super();
  factory GetDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDeviceRequest clone() => GetDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDeviceRequest copyWith(void Function(GetDeviceRequest) updates) => super.copyWith((message) => updates(message as GetDeviceRequest)) as GetDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDeviceRequest create() => GetDeviceRequest._();
  GetDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<GetDeviceRequest> createRepeated() => $pb.PbList<GetDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDeviceRequest>(create);
  static GetDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);
}

class ListDevicesRequest extends $pb.GeneratedMessage {
  factory ListDevicesRequest() => create();
  ListDevicesRequest._() : super();
  factory ListDevicesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDevicesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDevicesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDevicesRequest clone() => ListDevicesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDevicesRequest copyWith(void Function(ListDevicesRequest) updates) => super.copyWith((message) => updates(message as ListDevicesRequest)) as ListDevicesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDevicesRequest create() => ListDevicesRequest._();
  ListDevicesRequest createEmptyInstance() => create();
  static $pb.PbList<ListDevicesRequest> createRepeated() => $pb.PbList<ListDevicesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDevicesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDevicesRequest>(create);
  static ListDevicesRequest? _defaultInstance;
}

class ListDevicesResponse extends $pb.GeneratedMessage {
  factory ListDevicesResponse({
    $core.Iterable<Device>? devices,
  }) {
    final $result = create();
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    return $result;
  }
  ListDevicesResponse._() : super();
  factory ListDevicesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDevicesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDevicesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..pc<Device>(1, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDevicesResponse clone() => ListDevicesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDevicesResponse copyWith(void Function(ListDevicesResponse) updates) => super.copyWith((message) => updates(message as ListDevicesResponse)) as ListDevicesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDevicesResponse create() => ListDevicesResponse._();
  ListDevicesResponse createEmptyInstance() => create();
  static $pb.PbList<ListDevicesResponse> createRepeated() => $pb.PbList<ListDevicesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListDevicesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDevicesResponse>(create);
  static ListDevicesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Device> get devices => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
