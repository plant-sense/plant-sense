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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'alerts.pbenum.dart';

export 'alerts.pbenum.dart';

class NotificationAction extends $pb.GeneratedMessage {
  factory NotificationAction({
    $core.String? title,
    $core.String? message,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  NotificationAction._() : super();
  factory NotificationAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationAction clone() => NotificationAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationAction copyWith(void Function(NotificationAction) updates) => super.copyWith((message) => updates(message as NotificationAction)) as NotificationAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationAction create() => NotificationAction._();
  NotificationAction createEmptyInstance() => create();
  static $pb.PbList<NotificationAction> createRepeated() => $pb.PbList<NotificationAction>();
  @$core.pragma('dart2js:noInline')
  static NotificationAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationAction>(create);
  static NotificationAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class ActuatorAction extends $pb.GeneratedMessage {
  factory ActuatorAction({
    $core.String? actuatorId,
    $core.bool? state,
    $core.double? intensity,
  }) {
    final $result = create();
    if (actuatorId != null) {
      $result.actuatorId = actuatorId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (intensity != null) {
      $result.intensity = intensity;
    }
    return $result;
  }
  ActuatorAction._() : super();
  factory ActuatorAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActuatorAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActuatorAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'actuatorId')
    ..aOB(2, _omitFieldNames ? '' : 'state')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'intensity', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActuatorAction clone() => ActuatorAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActuatorAction copyWith(void Function(ActuatorAction) updates) => super.copyWith((message) => updates(message as ActuatorAction)) as ActuatorAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActuatorAction create() => ActuatorAction._();
  ActuatorAction createEmptyInstance() => create();
  static $pb.PbList<ActuatorAction> createRepeated() => $pb.PbList<ActuatorAction>();
  @$core.pragma('dart2js:noInline')
  static ActuatorAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActuatorAction>(create);
  static ActuatorAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get actuatorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set actuatorId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActuatorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActuatorId() => clearField(1);

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

enum AlertAction_Action {
  notification, 
  actuator, 
  notSet
}

class AlertAction extends $pb.GeneratedMessage {
  factory AlertAction({
    NotificationAction? notification,
    ActuatorAction? actuator,
  }) {
    final $result = create();
    if (notification != null) {
      $result.notification = notification;
    }
    if (actuator != null) {
      $result.actuator = actuator;
    }
    return $result;
  }
  AlertAction._() : super();
  factory AlertAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlertAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, AlertAction_Action> _AlertAction_ActionByTag = {
    1 : AlertAction_Action.notification,
    2 : AlertAction_Action.actuator,
    0 : AlertAction_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AlertAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<NotificationAction>(1, _omitFieldNames ? '' : 'notification', subBuilder: NotificationAction.create)
    ..aOM<ActuatorAction>(2, _omitFieldNames ? '' : 'actuator', subBuilder: ActuatorAction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlertAction clone() => AlertAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlertAction copyWith(void Function(AlertAction) updates) => super.copyWith((message) => updates(message as AlertAction)) as AlertAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AlertAction create() => AlertAction._();
  AlertAction createEmptyInstance() => create();
  static $pb.PbList<AlertAction> createRepeated() => $pb.PbList<AlertAction>();
  @$core.pragma('dart2js:noInline')
  static AlertAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlertAction>(create);
  static AlertAction? _defaultInstance;

  AlertAction_Action whichAction() => _AlertAction_ActionByTag[$_whichOneof(0)]!;
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  NotificationAction get notification => $_getN(0);
  @$pb.TagNumber(1)
  set notification(NotificationAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotification() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotification() => clearField(1);
  @$pb.TagNumber(1)
  NotificationAction ensureNotification() => $_ensure(0);

  @$pb.TagNumber(2)
  ActuatorAction get actuator => $_getN(1);
  @$pb.TagNumber(2)
  set actuator(ActuatorAction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasActuator() => $_has(1);
  @$pb.TagNumber(2)
  void clearActuator() => clearField(2);
  @$pb.TagNumber(2)
  ActuatorAction ensureActuator() => $_ensure(1);
}

class SetAlertRequest extends $pb.GeneratedMessage {
  factory SetAlertRequest({
    $core.String? deviceId,
    $core.double? threshold,
    AlertCondition? condition,
    AlertAction? action,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (threshold != null) {
      $result.threshold = threshold;
    }
    if (condition != null) {
      $result.condition = condition;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  SetAlertRequest._() : super();
  factory SetAlertRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAlertRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetAlertRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'threshold', $pb.PbFieldType.OD)
    ..e<AlertCondition>(3, _omitFieldNames ? '' : 'condition', $pb.PbFieldType.OE, defaultOrMaker: AlertCondition.ALERT_CONDITION_UNSPECIFIED, valueOf: AlertCondition.valueOf, enumValues: AlertCondition.values)
    ..aOM<AlertAction>(4, _omitFieldNames ? '' : 'action', subBuilder: AlertAction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAlertRequest clone() => SetAlertRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAlertRequest copyWith(void Function(SetAlertRequest) updates) => super.copyWith((message) => updates(message as SetAlertRequest)) as SetAlertRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetAlertRequest create() => SetAlertRequest._();
  SetAlertRequest createEmptyInstance() => create();
  static $pb.PbList<SetAlertRequest> createRepeated() => $pb.PbList<SetAlertRequest>();
  @$core.pragma('dart2js:noInline')
  static SetAlertRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAlertRequest>(create);
  static SetAlertRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get threshold => $_getN(1);
  @$pb.TagNumber(2)
  set threshold($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => clearField(2);

  @$pb.TagNumber(3)
  AlertCondition get condition => $_getN(2);
  @$pb.TagNumber(3)
  set condition(AlertCondition v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCondition() => $_has(2);
  @$pb.TagNumber(3)
  void clearCondition() => clearField(3);

  @$pb.TagNumber(4)
  AlertAction get action => $_getN(3);
  @$pb.TagNumber(4)
  set action(AlertAction v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearAction() => clearField(4);
  @$pb.TagNumber(4)
  AlertAction ensureAction() => $_ensure(3);
}

class SetAlertResponse extends $pb.GeneratedMessage {
  factory SetAlertResponse({
    $core.String? alertId,
  }) {
    final $result = create();
    if (alertId != null) {
      $result.alertId = alertId;
    }
    return $result;
  }
  SetAlertResponse._() : super();
  factory SetAlertResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAlertResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetAlertResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'alertId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAlertResponse clone() => SetAlertResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAlertResponse copyWith(void Function(SetAlertResponse) updates) => super.copyWith((message) => updates(message as SetAlertResponse)) as SetAlertResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetAlertResponse create() => SetAlertResponse._();
  SetAlertResponse createEmptyInstance() => create();
  static $pb.PbList<SetAlertResponse> createRepeated() => $pb.PbList<SetAlertResponse>();
  @$core.pragma('dart2js:noInline')
  static SetAlertResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAlertResponse>(create);
  static SetAlertResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get alertId => $_getSZ(0);
  @$pb.TagNumber(1)
  set alertId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlertId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlertId() => clearField(1);
}

class Alert extends $pb.GeneratedMessage {
  factory Alert({
    $core.String? alertId,
    $core.String? deviceId,
    $core.double? threshold,
    $core.double? value,
    $fixnum.Int64? timestamp,
    AlertCondition? condition,
    AlertAction? action,
  }) {
    final $result = create();
    if (alertId != null) {
      $result.alertId = alertId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (threshold != null) {
      $result.threshold = threshold;
    }
    if (value != null) {
      $result.value = value;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (condition != null) {
      $result.condition = condition;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  Alert._() : super();
  factory Alert.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Alert.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Alert', package: const $pb.PackageName(_omitMessageNames ? '' : 'plant_sense.internal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'alertId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'threshold', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OD)
    ..aInt64(5, _omitFieldNames ? '' : 'timestamp')
    ..e<AlertCondition>(6, _omitFieldNames ? '' : 'condition', $pb.PbFieldType.OE, defaultOrMaker: AlertCondition.ALERT_CONDITION_UNSPECIFIED, valueOf: AlertCondition.valueOf, enumValues: AlertCondition.values)
    ..aOM<AlertAction>(7, _omitFieldNames ? '' : 'action', subBuilder: AlertAction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Alert clone() => Alert()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Alert copyWith(void Function(Alert) updates) => super.copyWith((message) => updates(message as Alert)) as Alert;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Alert create() => Alert._();
  Alert createEmptyInstance() => create();
  static $pb.PbList<Alert> createRepeated() => $pb.PbList<Alert>();
  @$core.pragma('dart2js:noInline')
  static Alert getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Alert>(create);
  static Alert? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get alertId => $_getSZ(0);
  @$pb.TagNumber(1)
  set alertId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlertId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlertId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get threshold => $_getN(2);
  @$pb.TagNumber(3)
  set threshold($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreshold() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreshold() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get value => $_getN(3);
  @$pb.TagNumber(4)
  set value($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  AlertCondition get condition => $_getN(5);
  @$pb.TagNumber(6)
  set condition(AlertCondition v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCondition() => $_has(5);
  @$pb.TagNumber(6)
  void clearCondition() => clearField(6);

  @$pb.TagNumber(7)
  AlertAction get action => $_getN(6);
  @$pb.TagNumber(7)
  set action(AlertAction v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAction() => $_has(6);
  @$pb.TagNumber(7)
  void clearAction() => clearField(7);
  @$pb.TagNumber(7)
  AlertAction ensureAction() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
