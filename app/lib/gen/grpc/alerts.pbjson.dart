//
//  Generated code. Do not modify.
//  source: alerts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use alertConditionDescriptor instead')
const AlertCondition$json = {
  '1': 'AlertCondition',
  '2': [
    {'1': 'ALERT_CONDITION_UNSPECIFIED', '2': 0},
    {'1': 'ALERT_CONDITION_ABOVE', '2': 1},
    {'1': 'ALERT_CONDITION_BELOW', '2': 2},
  ],
};

/// Descriptor for `AlertCondition`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List alertConditionDescriptor = $convert.base64Decode(
    'Cg5BbGVydENvbmRpdGlvbhIfChtBTEVSVF9DT05ESVRJT05fVU5TUEVDSUZJRUQQABIZChVBTE'
    'VSVF9DT05ESVRJT05fQUJPVkUQARIZChVBTEVSVF9DT05ESVRJT05fQkVMT1cQAg==');

@$core.Deprecated('Use notificationActionDescriptor instead')
const NotificationAction$json = {
  '1': 'NotificationAction',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `NotificationAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationActionDescriptor = $convert.base64Decode(
    'ChJOb3RpZmljYXRpb25BY3Rpb24SFAoFdGl0bGUYASABKAlSBXRpdGxlEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use actuatorActionDescriptor instead')
const ActuatorAction$json = {
  '1': 'ActuatorAction',
  '2': [
    {'1': 'actuator_id', '3': 1, '4': 1, '5': 9, '10': 'actuatorId'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
    {'1': 'intensity', '3': 3, '4': 1, '5': 1, '9': 0, '10': 'intensity', '17': true},
  ],
  '8': [
    {'1': '_intensity'},
  ],
};

/// Descriptor for `ActuatorAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actuatorActionDescriptor = $convert.base64Decode(
    'Cg5BY3R1YXRvckFjdGlvbhIfCgthY3R1YXRvcl9pZBgBIAEoCVIKYWN0dWF0b3JJZBIUCgVzdG'
    'F0ZRgCIAEoCFIFc3RhdGUSIQoJaW50ZW5zaXR5GAMgASgBSABSCWludGVuc2l0eYgBAUIMCgpf'
    'aW50ZW5zaXR5');

@$core.Deprecated('Use alertActionDescriptor instead')
const AlertAction$json = {
  '1': 'AlertAction',
  '2': [
    {'1': 'notification', '3': 1, '4': 1, '5': 11, '6': '.plant_sense.internal.NotificationAction', '9': 0, '10': 'notification'},
    {'1': 'actuator', '3': 2, '4': 1, '5': 11, '6': '.plant_sense.internal.ActuatorAction', '9': 0, '10': 'actuator'},
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `AlertAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List alertActionDescriptor = $convert.base64Decode(
    'CgtBbGVydEFjdGlvbhJOCgxub3RpZmljYXRpb24YASABKAsyKC5wbGFudF9zZW5zZS5pbnRlcm'
    '5hbC5Ob3RpZmljYXRpb25BY3Rpb25IAFIMbm90aWZpY2F0aW9uEkIKCGFjdHVhdG9yGAIgASgL'
    'MiQucGxhbnRfc2Vuc2UuaW50ZXJuYWwuQWN0dWF0b3JBY3Rpb25IAFIIYWN0dWF0b3JCCAoGYW'
    'N0aW9u');

@$core.Deprecated('Use setAlertRequestDescriptor instead')
const SetAlertRequest$json = {
  '1': 'SetAlertRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'threshold', '3': 2, '4': 1, '5': 1, '10': 'threshold'},
    {'1': 'condition', '3': 3, '4': 1, '5': 14, '6': '.plant_sense.internal.AlertCondition', '10': 'condition'},
    {'1': 'action', '3': 4, '4': 1, '5': 11, '6': '.plant_sense.internal.AlertAction', '10': 'action'},
  ],
};

/// Descriptor for `SetAlertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAlertRequestDescriptor = $convert.base64Decode(
    'Cg9TZXRBbGVydFJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBIcCgl0aHJlc2'
    'hvbGQYAiABKAFSCXRocmVzaG9sZBJCCgljb25kaXRpb24YAyABKA4yJC5wbGFudF9zZW5zZS5p'
    'bnRlcm5hbC5BbGVydENvbmRpdGlvblIJY29uZGl0aW9uEjkKBmFjdGlvbhgEIAEoCzIhLnBsYW'
    '50X3NlbnNlLmludGVybmFsLkFsZXJ0QWN0aW9uUgZhY3Rpb24=');

@$core.Deprecated('Use setAlertResponseDescriptor instead')
const SetAlertResponse$json = {
  '1': 'SetAlertResponse',
  '2': [
    {'1': 'alert_id', '3': 1, '4': 1, '5': 9, '10': 'alertId'},
  ],
};

/// Descriptor for `SetAlertResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAlertResponseDescriptor = $convert.base64Decode(
    'ChBTZXRBbGVydFJlc3BvbnNlEhkKCGFsZXJ0X2lkGAEgASgJUgdhbGVydElk');

@$core.Deprecated('Use alertDescriptor instead')
const Alert$json = {
  '1': 'Alert',
  '2': [
    {'1': 'alert_id', '3': 1, '4': 1, '5': 9, '10': 'alertId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'threshold', '3': 3, '4': 1, '5': 1, '10': 'threshold'},
    {'1': 'value', '3': 4, '4': 1, '5': 1, '10': 'value'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'condition', '3': 6, '4': 1, '5': 14, '6': '.plant_sense.internal.AlertCondition', '10': 'condition'},
    {'1': 'action', '3': 7, '4': 1, '5': 11, '6': '.plant_sense.internal.AlertAction', '10': 'action'},
  ],
};

/// Descriptor for `Alert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List alertDescriptor = $convert.base64Decode(
    'CgVBbGVydBIZCghhbGVydF9pZBgBIAEoCVIHYWxlcnRJZBIbCglkZXZpY2VfaWQYAiABKAlSCG'
    'RldmljZUlkEhwKCXRocmVzaG9sZBgDIAEoAVIJdGhyZXNob2xkEhQKBXZhbHVlGAQgASgBUgV2'
    'YWx1ZRIcCgl0aW1lc3RhbXAYBSABKANSCXRpbWVzdGFtcBJCCgljb25kaXRpb24YBiABKA4yJC'
    '5wbGFudF9zZW5zZS5pbnRlcm5hbC5BbGVydENvbmRpdGlvblIJY29uZGl0aW9uEjkKBmFjdGlv'
    'bhgHIAEoCzIhLnBsYW50X3NlbnNlLmludGVybmFsLkFsZXJ0QWN0aW9uUgZhY3Rpb24=');

