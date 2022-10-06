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
        child: RaisedButton(
          color: Colors.red,
          child: Text('This is Main Screen'),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Screen2();
            // }));
            print('main screen button pressed');
          },
        ),
      ),
    );
  }
}
