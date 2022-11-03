import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/screens/main_screen.dart';
import 'package:vacuum_flutter/screens/testament_introduction_screen.dart';
import 'package:vacuum_flutter/common/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class TestamentListScreen extends StatefulWidget {
  const TestamentListScreen({Key? key}) : super(key: key);

  @override
  _TestamentListScreenState createState() => _TestamentListScreenState();
}

class _TestamentListScreenState extends State<TestamentListScreen> {
  String _currentPath = "";
  List<File> _fileList = [];

  @override
  void initState() {
    super.initState();
    _getSavedList();
  }

  _getSavedList() async {
    logD('getSavedListStarted');
    try {
      // Create Folder
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      logD('app document directory : $appDocDirectory');
      _currentPath = appDocDirectory.path + '/' + kDefaultFolderName;
      if (await Directory(_currentPath).exists()) {
        logD(' exist Dir: ' + _currentPath);
        Directory(_currentPath).list().forEach((element) async {
          logD('item : ' + await element.stat().toString());
          setState(() {
            _fileList.add(File(element.uri.toString()));
          });
        });
      } else {
        logD('Not exist Dir : ' + _currentPath);
      }
    } catch (e) {
      logD('fail to create default folder : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Testament List Screen'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text('${_fileList[index].toString()}'),
              onTap: () {
                logD('${_fileList[index]} is pressed');
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _fileList.length,
        // itemCount: _nameList.length,
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
