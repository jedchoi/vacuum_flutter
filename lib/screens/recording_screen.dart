import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/screens/testament_detail_screen.dart';
import 'package:vacuum_flutter/screens/testament_introduction_screen.dart';
import 'package:vacuum_flutter/common/logger.dart';

class RecordingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Recording Screen'),
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
                  "This is Recording Page",
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
                  logD('Recording Done. Go to Testament Saving Screen');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return TestamentDetailScreen(videoFile: XFile.fromData("d"),);
                  // }));
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
