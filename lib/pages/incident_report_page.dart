import 'dart:io';

import 'package:camera/camera.dart';
import 'package:city_care/pages/take_picture_page.dart';
import 'package:city_care/viewmodels/report_incident_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatefulWidget {
  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {
  ReportIncidentViewModel _reportIncidentViewModel;

  @override
  void initState() {
    super.initState();
    _reportIncidentViewModel =
        Provider.of<ReportIncidentViewModel>(context, listen: false);
  }

  void _showPhotoSelectionOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  _showCamera();
                },
                leading: Icon(Icons.photo_camera),
                title: Text('Take a picture'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  _showPhotoAlbum();
                },
                leading: Icon(Icons.photo_album),
                title: Text('Select from photo library'),
              ),
            ],
          ),
        );
      },
    );
  }

  _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePicturePage(camera: camera),
      ),
    );
    setState(() {
      _reportIncidentViewModel.imagePath = result;
    });
  }

  _showPhotoAlbum() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _reportIncidentViewModel.imagePath = image.path;
    });
  }

  void _saveIncident(BuildContext context) async {
    await _reportIncidentViewModel.saveIncident();
    Navigator.pop(context);
  }

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
            vm.imagePath == null
                ? Image.asset('images/header_img.jpeg')
                : Image.file(File(vm.imagePath)),
            FlatButton(
              color: Colors.grey,
              child:
                  Text('Take picture', style: TextStyle(color: Colors.white)),
              onPressed: () {
                print('Take picture');
                _showPhotoSelectionOptions(context);
              },
            ),
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
                _saveIncident(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
