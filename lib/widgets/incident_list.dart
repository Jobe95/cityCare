import 'package:city_care/viewmodels/incident_viewmodel.dart';
import 'package:flutter/material.dart';

class IncidentList extends StatelessWidget {
  final List<IncidentViewModel> incidents;

  IncidentList({this.incidents});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: incidents.length,
      itemBuilder: (context, index) {
        final incident = incidents[index];
        return ListTile(
          title: Text(incident.title),
          subtitle: Text(incident.description),
        );
      },
    );
  }
}
