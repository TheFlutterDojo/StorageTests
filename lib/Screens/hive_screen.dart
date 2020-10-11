import 'package:flutter/material.dart';

class HiveScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: Center(
        child: Text("Hive"),
      ),
    );
  }
}
