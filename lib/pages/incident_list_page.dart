import 'package:city_care/pages/incident_report_page.dart';
import 'package:city_care/viewmodels/incident_list_viewmodel.dart';
import 'package:city_care/viewmodels/report_incident_viewmodel.dart';
import 'package:city_care/widgets/incident_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPageState createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  Future<void> _navigateToReportIncidentPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => ReportIncidentViewModel(),
          child: IncidentReportPage(),
        ),
        fullscreenDialog: true,
      ),
    );

    _populateAllIncidents();
  }

  @override
  void initState() {
    super.initState();
    _populateAllIncidents();
  }

  _populateAllIncidents() {
    Provider.of<IncidentListViewModel>(context, listen: false)
        .getAllIncidents();
  }

  Widget _updateUI(IncidentListViewModel vm) {
    switch (vm.status) {
      case Status.loading:
        return Align(child: CircularProgressIndicator());

      case Status.empty:
        return Text('No incidents found!');
      case Status.success:
        return IncidentList(incidents: vm.incidents);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<IncidentListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents'),
      ),
      body: Stack(
        children: <Widget>[
          _updateUI(vm),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () async {
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
