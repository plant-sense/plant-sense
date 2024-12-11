//
//  Generated code. Do not modify.
//  source: alerts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'alerts.pb.dart' as $1;

export 'alerts.pb.dart';

@$pb.GrpcServiceName('plant_sense.internal.AlertService')
class AlertServiceClient extends $grpc.Client {
  static final _$setAlert = $grpc.ClientMethod<$1.SetAlertRequest, $1.SetAlertResponse>(
      '/plant_sense.internal.AlertService/SetAlert',
      ($1.SetAlertRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SetAlertResponse.fromBuffer(value));
  static final _$receiveAlerts = $grpc.ClientMethod<$1.SetAlertRequest, $1.Alert>(
      '/plant_sense.internal.AlertService/ReceiveAlerts',
      ($1.SetAlertRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Alert.fromBuffer(value));

  AlertServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.SetAlertResponse> setAlert($1.SetAlertRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setAlert, request, options: options);
  }

  $grpc.ResponseStream<$1.Alert> receiveAlerts($1.SetAlertRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$receiveAlerts, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('plant_sense.internal.AlertService')
abstract class AlertServiceBase extends $grpc.Service {
  $core.String get $name => 'plant_sense.internal.AlertService';

  AlertServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.SetAlertRequest, $1.SetAlertResponse>(
        'SetAlert',
        setAlert_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SetAlertRequest.fromBuffer(value),
        ($1.SetAlertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SetAlertRequest, $1.Alert>(
        'ReceiveAlerts',
        receiveAlerts_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.SetAlertRequest.fromBuffer(value),
        ($1.Alert value) => value.writeToBuffer()));
  }

  $async.Future<$1.SetAlertResponse> setAlert_Pre($grpc.ServiceCall call, $async.Future<$1.SetAlertRequest> request) async {
    return setAlert(call, await request);
  }

  $async.Stream<$1.Alert> receiveAlerts_Pre($grpc.ServiceCall call, $async.Future<$1.SetAlertRequest> request) async* {
    yield* receiveAlerts(call, await request);
  }

  $async.Future<$1.SetAlertResponse> setAlert($grpc.ServiceCall call, $1.SetAlertRequest request);
  $async.Stream<$1.Alert> receiveAlerts($grpc.ServiceCall call, $1.SetAlertRequest request);
}
