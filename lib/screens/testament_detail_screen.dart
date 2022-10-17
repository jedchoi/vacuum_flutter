import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/main_screen.dart';
import 'package:vacuum_flutter/screens/testament_introduction_screen.dart';

class TestamentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: MaterialButton(
                color: Colors.blue,
                child: Text('완료'),
                onPressed: () {
                  print('Testament Detail Page Done. Go to Main Screen');
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
