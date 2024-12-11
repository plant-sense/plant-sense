//
//  Generated code. Do not modify.
//  source: actuator_control.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ActuatorState extends $pb.GeneratedMessage {
  factory ActuatorState({
    $core.String? deviceId,
    $core.bool? state,
    $core.double? intensity,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (intensity != null) {
      $result.intensity = intensity;
    }
    return $result;
  }
  ActuatorState._() : super();
  factory ActuatorState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActuatorState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActuatorState', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOB(2, _omitFieldNames ? '' : 'state')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'intensity', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActuatorState clone() => ActuatorState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActuatorState copyWith(void Function(ActuatorState) updates) => super.copyWith((message) => updates(message as ActuatorState)) as ActuatorState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActuatorState create() => ActuatorState._();
  ActuatorState createEmptyInstance() => create();
  static $pb.PbList<ActuatorState> createRepeated() => $pb.PbList<ActuatorState>();
  @$core.pragma('dart2js:noInline')
  static ActuatorState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActuatorState>(create);
  static ActuatorState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get state => $_getBF(1);
  @$pb.TagNumber(2)
  set state($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get intensity => $_getN(2);
  @$pb.TagNumber(3)
  set intensity($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIntensity() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntensity() => clearField(3);
}

class SetActuatorStateRequest extends $pb.GeneratedMessage {
  factory SetActuatorStateRequest({
    $core.String? deviceId,
    $core.bool? state,
    $core.double? intensity,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (intensity != null) {
      $result.intensity = intensity;
    }
    return $result;
  }
  SetActuatorStateRequest._() : super();
  factory SetActuatorStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetActuatorStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetActuatorStateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOB(2, _omitFieldNames ? '' : 'state')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'intensity', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetActuatorStateRequest clone() => SetActuatorStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetActuatorStateRequest copyWith(void Function(SetActuatorStateRequest) updates) => super.copyWith((message) => updates(message as SetActuatorStateRequest)) as SetActuatorStateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetActuatorStateRequest create() => SetActuatorStateRequest._();
  SetActuatorStateRequest createEmptyInstance() => create();
  static $pb.PbList<SetActuatorStateRequest> createRepeated() => $pb.PbList<SetActuatorStateRequest>();
  @$core.pragma('dart2js:noInline')
  static SetActuatorStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetActuatorStateRequest>(create);
  static SetActuatorStateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get state => $_getBF(1);
  @$pb.TagNumber(2)
  set state($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get intensity => $_getN(2);
  @$pb.TagNumber(3)
  set intensity($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIntensity() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntensity() => clearField(3);
}

class GetActuatorStateRequest extends $pb.GeneratedMessage {
  factory GetActuatorStateRequest({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  GetActuatorStateRequest._() : super();
  factory GetActuatorStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetActuatorStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetActuatorStateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetActuatorStateRequest clone() => GetActuatorStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetActuatorStateRequest copyWith(void Function(GetActuatorStateRequest) updates) => super.copyWith((message) => updates(message as GetActuatorStateRequest)) as GetActuatorStateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActuatorStateRequest create() => GetActuatorStateRequest._();
  GetActuatorStateRequest createEmptyInstance() => create();
  static $pb.PbList<GetActuatorStateRequest> createRepeated() => $pb.PbList<GetActuatorStateRequest>();
  @$core.pragma('dart2js:noInline')
  static GetActuatorStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetActuatorStateRequest>(create);
  static GetActuatorStateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
