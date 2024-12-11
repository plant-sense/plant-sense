//
//  Generated code. Do not modify.
//  source: sensor_data.proto
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

import 'sensor_data.pb.dart' as $3;

export 'sensor_data.pb.dart';

@$pb.GrpcServiceName('plant_sense.internal.SensorService')
class SensorServiceClient extends $grpc.Client {
  static final _$getReading = $grpc.ClientMethod<$3.GetReadingRequest, $3.SensorReading>(
      '/plant_sense.internal.SensorService/GetReading',
      ($3.GetReadingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.SensorReading.fromBuffer(value));
  static final _$getHistoricalReadings = $grpc.ClientMethod<$3.GetHistoricalReadingsRequest, $3.SensorReadingStream>(
      '/plant_sense.internal.SensorService/GetHistoricalReadings',
      ($3.GetHistoricalReadingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.SensorReadingStream.fromBuffer(value));
  static final _$streamDeviceReadings = $grpc.ClientMethod<$3.GetReadingRequest, $3.SensorReading>(
      '/plant_sense.internal.SensorService/StreamDeviceReadings',
      ($3.GetReadingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.SensorReading.fromBuffer(value));
  static final _$streamAllReadings = $grpc.ClientMethod<$3.StreamReadingsRequest, $3.SensorReading>(
      '/plant_sense.internal.SensorService/StreamAllReadings',
      ($3.StreamReadingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.SensorReading.fromBuffer(value));

  SensorServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.SensorReading> getReading($3.GetReadingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getReading, request, options: options);
  }

  $grpc.ResponseFuture<$3.SensorReadingStream> getHistoricalReadings($3.GetHistoricalReadingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHistoricalReadings, request, options: options);
  }

  $grpc.ResponseStream<$3.SensorReading> streamDeviceReadings($3.GetReadingRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamDeviceReadings, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$3.SensorReading> streamAllReadings($3.StreamReadingsRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamAllReadings, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('plant_sense.internal.SensorService')
abstract class SensorServiceBase extends $grpc.Service {
  $core.String get $name => 'plant_sense.internal.SensorService';

  SensorServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.GetReadingRequest, $3.SensorReading>(
        'GetReading',
        getReading_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetReadingRequest.fromBuffer(value),
        ($3.SensorReading value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetHistoricalReadingsRequest, $3.SensorReadingStream>(
        'GetHistoricalReadings',
        getHistoricalReadings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetHistoricalReadingsRequest.fromBuffer(value),
        ($3.SensorReadingStream value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetReadingRequest, $3.SensorReading>(
        'StreamDeviceReadings',
        streamDeviceReadings_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.GetReadingRequest.fromBuffer(value),
        ($3.SensorReading value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.StreamReadingsRequest, $3.SensorReading>(
        'StreamAllReadings',
        streamAllReadings_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.StreamReadingsRequest.fromBuffer(value),
        ($3.SensorReading value) => value.writeToBuffer()));
  }

  $async.Future<$3.SensorReading> getReading_Pre($grpc.ServiceCall call, $async.Future<$3.GetReadingRequest> request) async {
    return getReading(call, await request);
  }

  $async.Future<$3.SensorReadingStream> getHistoricalReadings_Pre($grpc.ServiceCall call, $async.Future<$3.GetHistoricalReadingsRequest> request) async {
    return getHistoricalReadings(call, await request);
  }

  $async.Stream<$3.SensorReading> streamDeviceReadings_Pre($grpc.ServiceCall call, $async.Future<$3.GetReadingRequest> request) async* {
    yield* streamDeviceReadings(call, await request);
  }

  $async.Stream<$3.SensorReading> streamAllReadings_Pre($grpc.ServiceCall call, $async.Future<$3.StreamReadingsRequest> request) async* {
    yield* streamAllReadings(call, await request);
  }

  $async.Future<$3.SensorReading> getReading($grpc.ServiceCall call, $3.GetReadingRequest request);
  $async.Future<$3.SensorReadingStream> getHistoricalReadings($grpc.ServiceCall call, $3.GetHistoricalReadingsRequest request);
  $async.Stream<$3.SensorReading> streamDeviceReadings($grpc.ServiceCall call, $3.GetReadingRequest request);
  $async.Stream<$3.SensorReading> streamAllReadings($grpc.ServiceCall call, $3.StreamReadingsRequest request);
}
