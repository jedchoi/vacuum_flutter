import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/recording_screen.dart';
import 'package:vacuum_flutter/screens/test_recording_guide_screen.dart';

class TestamentIntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Testament introduction'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 12,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    "This is Testament introduction Page\nGive information of the Testament to user \non this screen.",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                color: Colors.purple,
                child: Text('사전 연습하기'),
                onPressed: () {
                  print('Go to Test Recording Guide Screen.');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestRecordingGuideScreen();
                  }));
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                color: Colors.blue,
                child: Text('영상 유언 남기기'),
                onPressed: () {
                  print('Go to RecordingScreen.');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RecordingScreen();
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
