//
//  Generated code. Do not modify.
//  source: alerts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AlertCondition extends $pb.ProtobufEnum {
  static const AlertCondition ALERT_CONDITION_UNSPECIFIED = AlertCondition._(0, _omitEnumNames ? '' : 'ALERT_CONDITION_UNSPECIFIED');
  static const AlertCondition ALERT_CONDITION_ABOVE = AlertCondition._(1, _omitEnumNames ? '' : 'ALERT_CONDITION_ABOVE');
  static const AlertCondition ALERT_CONDITION_BELOW = AlertCondition._(2, _omitEnumNames ? '' : 'ALERT_CONDITION_BELOW');

  static const $core.List<AlertCondition> values = <AlertCondition> [
    ALERT_CONDITION_UNSPECIFIED,
    ALERT_CONDITION_ABOVE,
    ALERT_CONDITION_BELOW,
  ];

  static final $core.Map<$core.int, AlertCondition> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AlertCondition? valueOf($core.int value) => _byValue[value];

  const AlertCondition._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
