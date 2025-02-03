import 'package:app/features/actuators/models/state.dart' as model;
import 'package:app/features/actuators/providers/actuator_provider.dart';
import 'package:app/gen/grpc/actuator_control.pbgrpc.dart';
import 'package:app/services/grpc_channel.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

class GrpcActuatorProvider extends ActuatorProvider {
  late final GrpcOrGrpcWebClientChannel channel;
  late final ActuatorServiceClient client;

  GrpcActuatorProvider({
    required String host,
    int port = 80,
  }) {
    channel = GrpcChannelService.createChannel(host: host, port: port);
    client = ActuatorServiceClient(channel);
  }

  @override
  Future<model.ActuatorState> getState(String deviceId) async {
    var state =
        await client.getState(GetActuatorStateRequest()..deviceId = deviceId);
    return model.ActuatorState(
      deviceId: state.deviceId,
      state: state.state,
      intensity: state.intensity,
    );
  }

  @override
  setState(String deviceId, model.ActuatorState state) async {
    await client.setState(SetActuatorStateRequest(
        deviceId: deviceId, state: state.state, intensity: state.intensity));
    notifyListeners();
  }
}
