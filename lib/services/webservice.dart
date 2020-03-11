import 'dart:convert';

import 'package:city_care/models/incidents.dart';
import 'package:dio/dio.dart';

class WebService {
  Future<void> saveIncident(Incident incident) async {
    final url = 'https://vast-savannah-75068.herokuapp.com/incidentsNoImage';

    await Dio().post(
      url,
      data: {'title': incident.title, 'description': incident.description},
      options: Options(contentType: 'application/x-www-form-urlencoded'),
    );
  }

  Future<List<Incident>> getAllIncidents() async {
    final url = 'https://vast-savannah-75068.herokuapp.com/incidents';

    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      final Iterable json = response.data;
      return json.map((incident) => Incident.fromJson(incident)).toList();
    } else {
      throw Exception('Unable to get incidents');
    }
  }
}
