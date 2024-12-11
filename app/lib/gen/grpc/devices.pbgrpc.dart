//
//  Generated code. Do not modify.
//  source: devices.proto
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

import 'devices.pb.dart' as $2;

export 'devices.pb.dart';

@$pb.GrpcServiceName('plant_sense.internal.DeviceService')
class DeviceServiceClient extends $grpc.Client {
  static final _$getDevice = $grpc.ClientMethod<$2.GetDeviceRequest, $2.Device>(
      '/plant_sense.internal.DeviceService/GetDevice',
      ($2.GetDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Device.fromBuffer(value));
  static final _$listDevices = $grpc.ClientMethod<$2.ListDevicesRequest, $2.ListDevicesResponse>(
      '/plant_sense.internal.DeviceService/ListDevices',
      ($2.ListDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListDevicesResponse.fromBuffer(value));

  DeviceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.Device> getDevice($2.GetDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDevice, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListDevicesResponse> listDevices($2.ListDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listDevices, request, options: options);
  }
}

@$pb.GrpcServiceName('plant_sense.internal.DeviceService')
abstract class DeviceServiceBase extends $grpc.Service {
  $core.String get $name => 'plant_sense.internal.DeviceService';

  DeviceServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetDeviceRequest, $2.Device>(
        'GetDevice',
        getDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetDeviceRequest.fromBuffer(value),
        ($2.Device value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListDevicesRequest, $2.ListDevicesResponse>(
        'ListDevices',
        listDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListDevicesRequest.fromBuffer(value),
        ($2.ListDevicesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.Device> getDevice_Pre($grpc.ServiceCall call, $async.Future<$2.GetDeviceRequest> request) async {
    return getDevice(call, await request);
  }

  $async.Future<$2.ListDevicesResponse> listDevices_Pre($grpc.ServiceCall call, $async.Future<$2.ListDevicesRequest> request) async {
    return listDevices(call, await request);
  }

  $async.Future<$2.Device> getDevice($grpc.ServiceCall call, $2.GetDeviceRequest request);
  $async.Future<$2.ListDevicesResponse> listDevices($grpc.ServiceCall call, $2.ListDevicesRequest request);
}
