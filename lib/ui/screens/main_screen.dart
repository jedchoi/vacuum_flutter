import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/ui/screens/setting_screen.dart';
import 'package:vacuum_flutter/ui/screens/testament_introduction_screen.dart';
import 'package:vacuum_flutter/ui/screens/testament_list_screen.dart';
import 'package:vacuum_flutter/common/logger.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Main Screen'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                logD('Go to Setting Screen button pressed');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingScreen();
                }));
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 5.0),
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  "This is Main Page",
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: kBottomButtonStyle,
                child: Text(
                  '영상 유언 남기기',
                  style: kButtonTextStyle,
                ),
                onPressed: () {
                  logD('Go to TestmentIntroductionScreen button pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestamentIntroductionScreen();
                  }));
                },
              ),
            ),
            SizedBox(height: 5.0),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: kBottomButtonStyle,
                child: Text(
                  '저장된 유언',
                  style: kButtonTextStyle,
                ),
                onPressed: () {
                  logD('Go to SavedTestmentScreen button pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestamentListScreen();
                  }));
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
