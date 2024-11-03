import 'package:app/home.dart';
import 'package:app/plant_gauges.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plant Sense',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
          useMaterial3: true,
          //  textTheme: GoogleFonts.notoSansTextTheme().copyWith().copyWith(),
        ),
        home: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Plant Sense"),
              backgroundColor: Colors.green.shade100,
            ),
            body: TabBarView(
              children: [
                PlantGaugesPage(title: "Plant [details]"),
                HomePage(),
                Icon(Icons.add_rounded)
              ],
            ),
            bottomNavigationBar: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.bar_chart_rounded)),
                Tab(icon: Icon(Icons.home_rounded)),
                Tab(icon: Icon(Icons.add_rounded))
              ],
            ),
          ),
        ));
  }
}
