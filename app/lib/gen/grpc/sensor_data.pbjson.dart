//
//  Generated code. Do not modify.
//  source: sensor_data.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readingDescriptor instead')
const Reading$json = {
  '1': 'Reading',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
    {'1': 'unit', '3': 2, '4': 1, '5': 9, '10': 'unit'},
  ],
};

/// Descriptor for `Reading`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readingDescriptor = $convert.base64Decode(
    'CgdSZWFkaW5nEhQKBXZhbHVlGAEgASgBUgV2YWx1ZRISCgR1bml0GAIgASgJUgR1bml0');

@$core.Deprecated('Use sensorReadingDescriptor instead')
const SensorReading$json = {
  '1': 'SensorReading',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'reading', '3': 3, '4': 1, '5': 11, '6': '.plant_sense.internal.Reading', '10': 'reading'},
  ],
};

/// Descriptor for `SensorReading`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sensorReadingDescriptor = $convert.base64Decode(
    'Cg1TZW5zb3JSZWFkaW5nEhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHAoJdGltZXN0YW'
    '1wGAIgASgDUgl0aW1lc3RhbXASNwoHcmVhZGluZxgDIAEoCzIdLnBsYW50X3NlbnNlLmludGVy'
    'bmFsLlJlYWRpbmdSB3JlYWRpbmc=');

@$core.Deprecated('Use sensorReadingStreamDescriptor instead')
const SensorReadingStream$json = {
  '1': 'SensorReadingStream',
  '2': [
    {'1': 'readings', '3': 1, '4': 3, '5': 11, '6': '.plant_sense.internal.SensorReading', '10': 'readings'},
  ],
};

/// Descriptor for `SensorReadingStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sensorReadingStreamDescriptor = $convert.base64Decode(
    'ChNTZW5zb3JSZWFkaW5nU3RyZWFtEj8KCHJlYWRpbmdzGAEgAygLMiMucGxhbnRfc2Vuc2UuaW'
    '50ZXJuYWwuU2Vuc29yUmVhZGluZ1IIcmVhZGluZ3M=');

@$core.Deprecated('Use getReadingRequestDescriptor instead')
const GetReadingRequest$json = {
  '1': 'GetReadingRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetReadingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReadingRequestDescriptor = $convert.base64Decode(
    'ChFHZXRSZWFkaW5nUmVxdWVzdBIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlk');

@$core.Deprecated('Use getHistoricalReadingsRequestDescriptor instead')
const GetHistoricalReadingsRequest$json = {
  '1': 'GetHistoricalReadingsRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'startTime', '17': true},
    {'1': 'end_time', '3': 3, '4': 1, '5': 3, '9': 1, '10': 'endTime', '17': true},
  ],
  '8': [
    {'1': '_start_time'},
    {'1': '_end_time'},
  ],
};

/// Descriptor for `GetHistoricalReadingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHistoricalReadingsRequestDescriptor = $convert.base64Decode(
    'ChxHZXRIaXN0b3JpY2FsUmVhZGluZ3NSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aW'
    'NlSWQSIgoKc3RhcnRfdGltZRgCIAEoA0gAUglzdGFydFRpbWWIAQESHgoIZW5kX3RpbWUYAyAB'
    'KANIAVIHZW5kVGltZYgBAUINCgtfc3RhcnRfdGltZUILCglfZW5kX3RpbWU=');

@$core.Deprecated('Use streamReadingsRequestDescriptor instead')
const StreamReadingsRequest$json = {
  '1': 'StreamReadingsRequest',
  '2': [
    {'1': 'device_ids', '3': 1, '4': 3, '5': 9, '10': 'deviceIds'},
  ],
};

/// Descriptor for `StreamReadingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamReadingsRequestDescriptor = $convert.base64Decode(
    'ChVTdHJlYW1SZWFkaW5nc1JlcXVlc3QSHQoKZGV2aWNlX2lkcxgBIAMoCVIJZGV2aWNlSWRz');

