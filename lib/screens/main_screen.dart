import 'package:flutter/material.dart';

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
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  "This is Main Page",
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: RaisedButton(
                color: Colors.purple,
                child: Text('영상 유언 남기기'),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Screen2();
                  // }));
                  print('main screen button pressed');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: RaisedButton(
                color: Colors.blue,
                child: Text('저장된 유언'),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Screen2();
                  // }));
                  print('main screen button pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
