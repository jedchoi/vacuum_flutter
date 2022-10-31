import 'package:flutter/material.dart';

const kTestamentCheckList = ['이름', '주소', '날짜', '기타'];
const kDefaultFolderName = "testament_video";

const kButtonTextStyle = TextStyle(
  fontSize: 17.0,
  fontFamily: 'Spartan MB',
);

final kBottomButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
);

final kTestamentCheckedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
);

final kTestamentUnCheckedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade400),
);
const kTestamentCheckedButtonTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Spartan MB',
  color: Colors.black,
);

final kTestamentNextButtonEnabledStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
);
final kTestamentNextButtonDisabledStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
);
const kTestamentNextButtonEnabledTextStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Spartan MB',
  color: Colors.black,
);
const kTestamentNextButtonDisabledTextStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Spartan MB',
  color: Colors.black12,
);
