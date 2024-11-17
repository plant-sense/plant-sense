import 'package:app/components/linear_gauge.dart';
import 'package:app/components/network_loading_image.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:app/layout/breakpoints.dart';
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
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > lgBreakpoint
                          ? 400
                          : 200,
                      height: MediaQuery.of(context).size.width > lgBreakpoint
                          ? 400
                          : 200,
                      child: NetworkLoadingImage(
                        url:
                            "https://images.unsplash.com/photo-1525498128493-380d1990a112?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Plant",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Monstera deliciosa",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text("Planted on 9/11/2001")
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              LinearGauge(
                name: "Soil humidity",
                value: 20 * 1.0,
                minimum: 0.0,
                maximum: 100.0,
                idealMinimum: 25.0,
                idealMaximum: 75.0,
              ),
              LinearGauge(
                name: "Light intensity",
                value: 20 * 25.0,
                minimum: 0.0,
                maximum: 1000.0,
                idealMinimum: 600.0,
                idealMaximum: 900.0,
              ),
              LinearGauge(
                name: "Temperature",
                value: 10 * 2.0,
                minimum: 0.0,
                maximum: 50.0,
                idealMinimum: 20.0,
                idealMaximum: 25.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
