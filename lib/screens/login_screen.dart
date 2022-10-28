import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/common/logger.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          style: kBottomButtonStyle,
          child: Text(
            'This is Login Screen',
            style: kButtonTextStyle,
          ),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Screen2();
            // }));
            logD('login screen button pressed');
          },
        ),
      ),
    );
  }
}
