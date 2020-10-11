import 'package:flutter/material.dart';

class SqliteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SqliteScreenState();
}

class _SqliteScreenState extends State<SqliteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
      ),
      body: Center(
        child: Text("sqlite"),
      ),
    );
  }
}
