import 'package:city_care/pages/incident_report_page.dart';
import 'package:city_care/widgets/incident_list.dart';
import 'package:flutter/material.dart';

class IncidentListPage extends StatelessWidget {
  Future<void> _navigateToReportIncidentPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncidentReportPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents'),
      ),
      body: Stack(
        children: <Widget>[
          IncidentList(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _navigateToReportIncidentPage(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
