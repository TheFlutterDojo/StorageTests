import 'package:flutter/material.dart';

class PageSelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildOption(context, "Hive", "/hive"),
          _buildOption(context, "SQLite", "/sqlite")
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String text, String route) {
    return ListTile(
      title: Text(text),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}
