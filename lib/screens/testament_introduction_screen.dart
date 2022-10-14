import 'package:flutter/material.dart';

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
            Expanded(
              flex: 2,
              child: MaterialButton(
                color: Colors.purple,
                child: Text('사전 연습하기'),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Screen2();
                  // }));
                  print('Testament introduction button1 pressed');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                color: Colors.blue,
                child: Text('영상 유언 남기기'),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Screen2();
                  // }));
                  print('Testament introduction button2 pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
