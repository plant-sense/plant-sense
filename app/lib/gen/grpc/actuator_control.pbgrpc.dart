//
//  Generated code. Do not modify.
//  source: actuator_control.proto
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

import 'actuator_control.pb.dart' as $0;

export 'actuator_control.pb.dart';

@$pb.GrpcServiceName('plant_sense.internal.ActuatorService')
class ActuatorServiceClient extends $grpc.Client {
  static final _$getState = $grpc.ClientMethod<$0.GetActuatorStateRequest, $0.ActuatorState>(
      '/plant_sense.internal.ActuatorService/GetState',
      ($0.GetActuatorStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ActuatorState.fromBuffer(value));
  static final _$setState = $grpc.ClientMethod<$0.SetActuatorStateRequest, $0.ActuatorState>(
      '/plant_sense.internal.ActuatorService/SetState',
      ($0.SetActuatorStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ActuatorState.fromBuffer(value));
  static final _$streamState = $grpc.ClientMethod<$0.GetActuatorStateRequest, $0.ActuatorState>(
      '/plant_sense.internal.ActuatorService/StreamState',
      ($0.GetActuatorStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ActuatorState.fromBuffer(value));

  ActuatorServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ActuatorState> getState($0.GetActuatorStateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getState, request, options: options);
  }

  $grpc.ResponseFuture<$0.ActuatorState> setState($0.SetActuatorStateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setState, request, options: options);
  }

  $grpc.ResponseStream<$0.ActuatorState> streamState($0.GetActuatorStateRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamState, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('plant_sense.internal.ActuatorService')
abstract class ActuatorServiceBase extends $grpc.Service {
  $core.String get $name => 'plant_sense.internal.ActuatorService';

  ActuatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetActuatorStateRequest, $0.ActuatorState>(
        'GetState',
        getState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetActuatorStateRequest.fromBuffer(value),
        ($0.ActuatorState value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetActuatorStateRequest, $0.ActuatorState>(
        'SetState',
        setState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetActuatorStateRequest.fromBuffer(value),
        ($0.ActuatorState value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetActuatorStateRequest, $0.ActuatorState>(
        'StreamState',
        streamState_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetActuatorStateRequest.fromBuffer(value),
        ($0.ActuatorState value) => value.writeToBuffer()));
  }

  $async.Future<$0.ActuatorState> getState_Pre($grpc.ServiceCall call, $async.Future<$0.GetActuatorStateRequest> request) async {
    return getState(call, await request);
  }

  $async.Future<$0.ActuatorState> setState_Pre($grpc.ServiceCall call, $async.Future<$0.SetActuatorStateRequest> request) async {
    return setState(call, await request);
  }

  $async.Stream<$0.ActuatorState> streamState_Pre($grpc.ServiceCall call, $async.Future<$0.GetActuatorStateRequest> request) async* {
    yield* streamState(call, await request);
  }

  $async.Future<$0.ActuatorState> getState($grpc.ServiceCall call, $0.GetActuatorStateRequest request);
  $async.Future<$0.ActuatorState> setState($grpc.ServiceCall call, $0.SetActuatorStateRequest request);
  $async.Stream<$0.ActuatorState> streamState($grpc.ServiceCall call, $0.GetActuatorStateRequest request);
}
