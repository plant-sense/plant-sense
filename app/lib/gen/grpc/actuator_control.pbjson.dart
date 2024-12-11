//
//  Generated code. Do not modify.
//  source: actuator_control.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use actuatorStateDescriptor instead')
const ActuatorState$json = {
  '1': 'ActuatorState',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
    {'1': 'intensity', '3': 3, '4': 1, '5': 1, '9': 0, '10': 'intensity', '17': true},
  ],
  '8': [
    {'1': '_intensity'},
  ],
};

/// Descriptor for `ActuatorState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actuatorStateDescriptor = $convert.base64Decode(
    'Cg1BY3R1YXRvclN0YXRlEhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSFAoFc3RhdGUYAi'
    'ABKAhSBXN0YXRlEiEKCWludGVuc2l0eRgDIAEoAUgAUglpbnRlbnNpdHmIAQFCDAoKX2ludGVu'
    'c2l0eQ==');

@$core.Deprecated('Use setActuatorStateRequestDescriptor instead')
const SetActuatorStateRequest$json = {
  '1': 'SetActuatorStateRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
    {'1': 'intensity', '3': 3, '4': 1, '5': 1, '9': 0, '10': 'intensity', '17': true},
  ],
  '8': [
    {'1': '_intensity'},
  ],
};

/// Descriptor for `SetActuatorStateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActuatorStateRequestDescriptor = $convert.base64Decode(
    'ChdTZXRBY3R1YXRvclN0YXRlUmVxdWVzdBIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlkEh'
    'QKBXN0YXRlGAIgASgIUgVzdGF0ZRIhCglpbnRlbnNpdHkYAyABKAFIAFIJaW50ZW5zaXR5iAEB'
    'QgwKCl9pbnRlbnNpdHk=');

@$core.Deprecated('Use getActuatorStateRequestDescriptor instead')
const GetActuatorStateRequest$json = {
  '1': 'GetActuatorStateRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetActuatorStateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActuatorStateRequestDescriptor = $convert.base64Decode(
    'ChdHZXRBY3R1YXRvclN0YXRlUmVxdWVzdBIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlk');

