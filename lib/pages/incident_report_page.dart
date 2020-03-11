import 'package:city_care/viewmodels/report_incident_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ReportIncidentViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding incidents'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) => vm.title = value,
              decoration: InputDecoration(
                labelText: 'Enter title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              onChanged: (value) => vm.description = value,
              textInputAction: TextInputAction.done,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Enter description',
              ),
            ),
            FlatButton(
              child: Text('Save', style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () {
                vm.saveIncident();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
