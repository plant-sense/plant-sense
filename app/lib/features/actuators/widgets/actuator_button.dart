import 'package:flutter/material.dart';
import 'package:app/features/actuators/models/state.dart';
import 'package:app/features/actuators/providers/actuator_provider.dart';
import 'package:provider/provider.dart';

class ActuatorButton extends StatelessWidget {
  final String actuatorId;

  const ActuatorButton({super.key, required this.actuatorId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final actuatorState = context.watch<ActuatorProvider>();
    final state = actuatorState.getState(actuatorId);

    return FutureBuilder<ActuatorState>(
      future: state,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return CircularProgressIndicator();
        }

        final isOn = snapshot.data?.state ?? false;
        final text = isOn ? "On" : "Off";

        return Row(
          spacing: 8,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            IconButton.filled(
              style: isOn
                  ? FilledButton.styleFrom(
                      backgroundColor: theme.primary,
                    )
                  : FilledButton.styleFrom(
                      backgroundColor: theme.error,
                    ),
              icon: Icon(
                Icons.power_settings_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                final newState = ActuatorState(
                  deviceId: actuatorId,
                  state: !isOn,
                );
                context.read<ActuatorProvider>().setState(actuatorId, newState);
              },
            ),
          ],
        );
      },
    );
  }
}
