import 'package:app/features/metrics/widgets/radial_gauge.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';

class PlantGaugesPage extends StatefulWidget {
  const PlantGaugesPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PlantGaugesPage> createState() => _PlantGaugesPageState();
}

class _PlantGaugesPageState extends State<PlantGaugesPage> {
  int _soilHumidity = 0;
  int _lightIntensity = 0;
  int _temperature = 0;

  void setSoilHumidity(int h) {
    setState(() {
      _soilHumidity = h;
    });
  }

  void setLightIntensity(int l) {
    setState(() {
      _lightIntensity = l;
    });
  }

  void setTemperature(int t) {
    setState(() {
      _temperature = t;
    });
  }

  void increaseSoilHumidity(int delta) {
    setSoilHumidity(_soilHumidity + delta);
  }

  void increaseLightIntensity(int delta) {
    setLightIntensity(_lightIntensity + delta);
  }

  void increaseTemperature(int delta) {
    setTemperature(_temperature + delta);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BreakpointContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Plant has been bombed",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RadialGauge(
                  name: "Soil humidity",
                  value: _soilHumidity * 1.0,
                  minimum: 0.0,
                  maximum: 100.0,
                  idealMinimum: 25.0,
                  idealMaximum: 75.0,
                ),
                RadialGauge(
                  name: "Light intensity",
                  value: _lightIntensity * 25.0,
                  minimum: 0.0,
                  maximum: 1000.0,
                  idealMinimum: 600.0,
                  idealMaximum: 900.0,
                ),
                RadialGauge(
                  name: "Temperature",
                  value: _temperature * 2.0,
                  minimum: 0.0,
                  maximum: 50.0,
                  idealMinimum: 20.0,
                  idealMaximum: 25.0,
                ),
              ],
            )
          ],
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () {
              increaseSoilHumidity(5);
            },
            tooltip: 'Increment soil humidity',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              increaseLightIntensity(200);
            },
            tooltip: 'Increment light intensity',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              increaseTemperature(1);
            },
            tooltip: 'Increment temperature',
            child: const Icon(Icons.add),
          ),
        ]),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
