import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/ui/screens/login_screen.dart';
import 'package:vacuum_flutter/ui/screens/main_screen.dart';
import 'package:vacuum_flutter/domain/entities/user.dart';

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
          ElevatedButton(
            style: kBottomButtonStyle,
            child: Text(
              'Go to Login Screen',
              style: kButtonTextStyle,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
          ElevatedButton(
            style: kBottomButtonStyle,
            child: Text(
              'Go to Main Screen',
              style: kButtonTextStyle,
            ),
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
