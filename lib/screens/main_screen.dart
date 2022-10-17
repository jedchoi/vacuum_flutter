import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/testament_introduction_screen.dart';
import 'package:vacuum_flutter/screens/testament_list_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Main Screen'),
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
              child: Center(
                child: Text(
                  "This is Main Page",
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
                child: Text('영상 유언 남기기'),
                onPressed: () {
                  print('Go to TestmentIntroductionScreen button pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestamentIntroductionScreen();
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
                child: Text('저장된 유언'),
                onPressed: () {
                  print('Go to SavedTestmentScreen button pressed');
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
