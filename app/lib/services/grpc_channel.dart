import 'package:flutter/foundation.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

class GrpcChannelService {
  static GrpcOrGrpcWebClientChannel createChannel({
    required String host,
    required int port,
  }) {
    print("GRPC host $host, port $port");
    var uri = _getUri(host, port);
    print("GRPC base path ${uri.toString()}");
    return GrpcOrGrpcWebClientChannel.toSingleEndpoint(
      host: host,
      port: port,
      transportSecure: false,
    );
  }

  static Uri _getUri(String host, int port) {
    if (!kIsWeb) {
      return Uri(host: host, port: port);
    }

    var base = Uri.base;
    return Uri(scheme: base.scheme, host: base.host, port: port);
  }
}
