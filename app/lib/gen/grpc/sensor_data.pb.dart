//
//  Generated code. Do not modify.
//  source: sensor_data.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Reading extends $pb.GeneratedMessage {
  factory Reading({
    $core.double? value,
    $core.String? unit,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (unit != null) {
      $result.unit = unit;
    }
    return $result;
  }
  Reading._() : super();
  factory Reading.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reading.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reading', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OD)
    ..aOS(2, _omitFieldNames ? '' : 'unit')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reading clone() => Reading()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reading copyWith(void Function(Reading) updates) => super.copyWith((message) => updates(message as Reading)) as Reading;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reading create() => Reading._();
  Reading createEmptyInstance() => create();
  static $pb.PbList<Reading> createRepeated() => $pb.PbList<Reading>();
  @$core.pragma('dart2js:noInline')
  static Reading getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reading>(create);
  static Reading? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get unit => $_getSZ(1);
  @$pb.TagNumber(2)
  set unit($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnit() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnit() => clearField(2);
}

class SensorReading extends $pb.GeneratedMessage {
  factory SensorReading({
    $core.String? deviceId,
    $fixnum.Int64? timestamp,
    Reading? reading,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (reading != null) {
      $result.reading = reading;
    }
    return $result;
  }
  SensorReading._() : super();
  factory SensorReading.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SensorReading.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SensorReading', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..aOM<Reading>(3, _omitFieldNames ? '' : 'reading', subBuilder: Reading.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SensorReading clone() => SensorReading()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SensorReading copyWith(void Function(SensorReading) updates) => super.copyWith((message) => updates(message as SensorReading)) as SensorReading;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SensorReading create() => SensorReading._();
  SensorReading createEmptyInstance() => create();
  static $pb.PbList<SensorReading> createRepeated() => $pb.PbList<SensorReading>();
  @$core.pragma('dart2js:noInline')
  static SensorReading getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SensorReading>(create);
  static SensorReading? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  Reading get reading => $_getN(2);
  @$pb.TagNumber(3)
  set reading(Reading v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReading() => $_has(2);
  @$pb.TagNumber(3)
  void clearReading() => clearField(3);
  @$pb.TagNumber(3)
  Reading ensureReading() => $_ensure(2);
}

class SensorReadingStream extends $pb.GeneratedMessage {
  factory SensorReadingStream({
    $core.Iterable<SensorReading>? readings,
  }) {
    final $result = create();
    if (readings != null) {
      $result.readings.addAll(readings);
    }
    return $result;
  }
  SensorReadingStream._() : super();
  factory SensorReadingStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SensorReadingStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SensorReadingStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..pc<SensorReading>(1, _omitFieldNames ? '' : 'readings', $pb.PbFieldType.PM, subBuilder: SensorReading.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SensorReadingStream clone() => SensorReadingStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SensorReadingStream copyWith(void Function(SensorReadingStream) updates) => super.copyWith((message) => updates(message as SensorReadingStream)) as SensorReadingStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SensorReadingStream create() => SensorReadingStream._();
  SensorReadingStream createEmptyInstance() => create();
  static $pb.PbList<SensorReadingStream> createRepeated() => $pb.PbList<SensorReadingStream>();
  @$core.pragma('dart2js:noInline')
  static SensorReadingStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SensorReadingStream>(create);
  static SensorReadingStream? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SensorReading> get readings => $_getList(0);
}

class GetReadingRequest extends $pb.GeneratedMessage {
  factory GetReadingRequest({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  GetReadingRequest._() : super();
  factory GetReadingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetReadingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetReadingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetReadingRequest clone() => GetReadingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetReadingRequest copyWith(void Function(GetReadingRequest) updates) => super.copyWith((message) => updates(message as GetReadingRequest)) as GetReadingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReadingRequest create() => GetReadingRequest._();
  GetReadingRequest createEmptyInstance() => create();
  static $pb.PbList<GetReadingRequest> createRepeated() => $pb.PbList<GetReadingRequest>();
  @$core.pragma('dart2js:noInline')
  static GetReadingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetReadingRequest>(create);
  static GetReadingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);
}

class GetHistoricalReadingsRequest extends $pb.GeneratedMessage {
  factory GetHistoricalReadingsRequest({
    $core.String? deviceId,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    return $result;
  }
  GetHistoricalReadingsRequest._() : super();
  factory GetHistoricalReadingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHistoricalReadingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetHistoricalReadingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aInt64(2, _omitFieldNames ? '' : 'startTime')
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHistoricalReadingsRequest clone() => GetHistoricalReadingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHistoricalReadingsRequest copyWith(void Function(GetHistoricalReadingsRequest) updates) => super.copyWith((message) => updates(message as GetHistoricalReadingsRequest)) as GetHistoricalReadingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHistoricalReadingsRequest create() => GetHistoricalReadingsRequest._();
  GetHistoricalReadingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetHistoricalReadingsRequest> createRepeated() => $pb.PbList<GetHistoricalReadingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetHistoricalReadingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHistoricalReadingsRequest>(create);
  static GetHistoricalReadingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);
}

class StreamReadingsRequest extends $pb.GeneratedMessage {
  factory StreamReadingsRequest({
    $core.Iterable<$core.String>? deviceIds,
  }) {
    final $result = create();
    if (deviceIds != null) {
      $result.deviceIds.addAll(deviceIds);
    }
    return $result;
  }
  StreamReadingsRequest._() : super();
  factory StreamReadingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamReadingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamReadingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'deviceIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamReadingsRequest clone() => StreamReadingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamReadingsRequest copyWith(void Function(StreamReadingsRequest) updates) => super.copyWith((message) => updates(message as StreamReadingsRequest)) as StreamReadingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamReadingsRequest create() => StreamReadingsRequest._();
  StreamReadingsRequest createEmptyInstance() => create();
  static $pb.PbList<StreamReadingsRequest> createRepeated() => $pb.PbList<StreamReadingsRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamReadingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamReadingsRequest>(create);
  static StreamReadingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get deviceIds => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
