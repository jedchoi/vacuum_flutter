import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/screens/main_screen.dart';
import 'package:vacuum_flutter/screens/testament_introduction_screen.dart';
import 'package:vacuum_flutter/common/logger.dart';

class TestamentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Testament List Screen'),
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
                  "This is Testament List Page",
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
                  logD('Testament List Page Done. Go to Main Screen');
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
