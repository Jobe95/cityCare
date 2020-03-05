import 'package:city_care/pages/incident_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IncidentListPage(),
    );
  }
}
