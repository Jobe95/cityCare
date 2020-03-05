import 'package:flutter/material.dart';

class IncidentReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding incidents'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
