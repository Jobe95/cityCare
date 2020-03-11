import 'package:city_care/models/incidents.dart';

class IncidentViewModel {
  final Incident incident;

  IncidentViewModel({this.incident});

  String get title {
    return incident.title;
  }

  String get description {
    return incident.description;
  }
}
