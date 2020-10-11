import 'package:StorageTests/Screens/hive_screen.dart';
import 'package:StorageTests/Screens/page_selector_screen.dart';
import 'package:StorageTests/Screens/sqlite_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Storage Demos',
      initialRoute: "/",
      routes: {
        '/': (_) => PageSelectorScreen(),
        "/hive": (_) => HiveScreen(),
        "/sqlite": (_) => SqliteScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
