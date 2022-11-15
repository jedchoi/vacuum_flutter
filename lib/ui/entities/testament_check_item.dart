import 'package:vacuum_flutter/common/logger.dart';

class TestamentCheckItem {
  final String name;
  bool isSelected;

  TestamentCheckItem({required this.name, this.isSelected = false});

  selected() {
    logD('isSelected = $isSelected');
    isSelected = !isSelected;
    logD('isSelected = $isSelected');
  }
}
