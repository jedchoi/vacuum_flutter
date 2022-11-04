import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/common/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class TestamentDetailScreen extends StatefulWidget {
  final XFile videoFile;
  const TestamentDetailScreen({Key? key, required this.videoFile})
      : super(key: key);

  @override
  _TestamentDetailScreenState createState() => _TestamentDetailScreenState();
}

class _TestamentDetailScreenState extends State<TestamentDetailScreen> {
  String _currentPath = "";

  @override
  void initState() {
    super.initState();
  }

  _getStoragePermission() async {
    if (await Permission.storage.isGranted) {
      logD('Storage permission is granted.');
      _saveFile();
    } else {
      logD('Request Storage permission.');
      var result = await Permission.storage.request();
      if (result == PermissionStatus.granted) {
        logD('Storage permission is granted.');
        _saveFile();
      } else {
        logD('Fail to get Storage permission.');
      }
    }
  }

  _createFolder(BuildContext context) async {
    logD('createFolder start');
    try {
      // Create Folder
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      logD('app document directory : $appDocDirectory');
      _currentPath = appDocDirectory.path + '/' + kDefaultFolderName;
      if (await Directory(_currentPath).exists()) {
        logD('Already exist Dir: ' + _currentPath);
      } else {
        new Directory(_currentPath)
            .create(recursive: true)
            .then((Directory directory) {
          logD('Path of New Dir: ' + _currentPath);
        });
      }
    } catch (e) {
      logD('fail to create default folder : $e');
    }
  }

  _saveFile() async {
    logD('save file start');
    await _createFolder(context);
    logD(
        'save file path : ' + _currentPath + '/' + 'video' + _getCurrentTime());

    await widget.videoFile
        .saveTo(_currentPath + '/' + 'Ready' + _getCurrentTime() + '.mp4');
    Directory(_currentPath).list()
        // .where((e) => e is File)
        .forEach((element) async {
      logD("item : " + await element.path);
    });
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    return now
        .toString()
        .split('.')
        .first
        .replaceAll('-', '')
        .replaceAll(':', '')
        .replaceAll(' ', '');
  }

  @override
  Widget build(BuildContext context) {
    _getStoragePermission();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Testament Detail Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 14,
              child: Center(
                child: Text(
                  "This is Testament Detail Page",
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: kBottomButtonStyle,
                child: Text(
                  '완료',
                  style: kButtonTextStyle,
                ),
                onPressed: () {
                  logD('Testament Detail Page Done. Go to Main Screen');
                  // Navigator.of(context).pop();
                  // .popUntil(ModalRoute.withName('/MainScreen'));
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
