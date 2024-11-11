import 'package:app/components/radial_gauge.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:app/layout/breakpoints.dart';
import 'package:app/scroll.dart';
import 'package:flutter/material.dart';

class PlantPage extends StatelessWidget {
  final String id;
  const PlantPage({required this.id, super.key});
  @override
  Widget build(BuildContext context) {
    return BreakpointContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                    ),
                  )
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Plant"),
                  Text("Monstera delciosa"),
                  Text("Planted on 9/11/2001")
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ScrollConfiguration(
              behavior: WebWorkingScrollBehavior(),
              child: GridView.count(
                crossAxisCount:
                    MediaQuery.sizeOf(context).width >= mdBreakpoint ? 3 : 1,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400,
                    height: 400,
                    child: RadialGauge(
                      name: "TEST",
                      value: 20,
                      minimum: 0,
                      maximum: 40,
                      idealMinimum: 10,
                      idealMaximum: 30,
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 400,
                    child: RadialGauge(
                      name: "TEST",
                      value: 20,
                      minimum: 0,
                      maximum: 40,
                      idealMinimum: 10,
                      idealMaximum: 30,
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 400,
                    child: RadialGauge(
                      name: "TEST",
                      value: 20,
                      minimum: 0,
                      maximum: 40,
                      idealMinimum: 10,
                      idealMaximum: 30,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
