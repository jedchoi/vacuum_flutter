import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/login_screen.dart';
import 'package:vacuum_flutter/screens/main_screen.dart';
import 'package:vacuum_flutter/services/user.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();
  }

  void getUserData() {
    var userModel = UserModel();
    setState(() {
      if (userModel.isLogedIn()) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainScreen();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Loading Screen'),
          MaterialButton(
            color: Colors.orange,
            child: Text('Go to Login Screen'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
          MaterialButton(
            color: Colors.purple,
            child: Text('Go to Main Screen'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              }));
            },
          ),
        ],
      ),
    ));
  }
}
