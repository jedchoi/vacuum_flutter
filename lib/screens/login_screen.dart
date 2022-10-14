import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Login Screen'),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.red,
          child: Text('This is Login Screen'),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Screen2();
            // }));
            print('login screen button pressed');
          },
        ),
      ),
    );
  }
}
