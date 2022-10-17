import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/testament_introduction_screen.dart';

class TestRecordingGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Test Recording Gude Screen'),
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
                  "This is Test Recording Guide Page",
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                color: Colors.blue,
                child: Text('완료'),
                onPressed: () {
                  print('Go to Test Recording Guide Screen.');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestRecordingGuideScreen();
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
