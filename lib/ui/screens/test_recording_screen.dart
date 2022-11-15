import 'package:flutter/material.dart';
import 'package:vacuum_flutter/common/constant.dart';
import 'package:vacuum_flutter/common/logger.dart';
import 'package:vacuum_flutter/ui/entities/testament_check_item.dart';
import 'package:vacuum_flutter/ui/screens/testament_detail_screen.dart';
import 'package:camera/camera.dart';

class TestRecordingScreen extends StatefulWidget {
  const TestRecordingScreen({Key? key}) : super(key: key);

  @override
  _TestRecordingScreenState createState() => _TestRecordingScreenState();
}

class _TestRecordingScreenState extends State<TestRecordingScreen> {
  bool _isLoading = true;
  bool _isRecording = false;
  bool _isNextEnabled = false;
  late CameraController _cameraController;
  List<TestamentCheckItem> testamentCheckList =
      kTestamentCheckList.map((e) => TestamentCheckItem(name: e)).toList();

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    if (!_isRecording) {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  _stopRecording() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => TestamentDetailScreen(videoFile: file),
      );
      Navigator.push(context, route);
    }
  }

  _updateCheckButtonStatus() {
    bool isAllItemSelected = true;
    testamentCheckList.forEach((element) {
      if (element.isSelected == false) {
        isAllItemSelected = false;
      }
    });
    setState(() {
      _isNextEnabled = isAllItemSelected;
    });
  }

  Widget _getCheckListButton(TestamentCheckItem item) {
    return Expanded(
      flex: 3,
      child: ElevatedButton(
        style: item.isSelected
            ? kTestamentCheckedButtonStyle
            : kTestamentUnCheckedButtonStyle,
        child: Text(
          item.name,
          style: kTestamentCheckedButtonTextStyle,
        ),
        onPressed: () {
          logD('${item.name} button is pressed');
          if (_isRecording) {
            setState(() {
              item.selected();
            });
            _updateCheckButtonStatus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Column(
          children: [
            Expanded(
              flex: 17,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CameraPreview(_cameraController),
                  Visibility(
                    visible: !_isRecording,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: FloatingActionButton(
                        backgroundColor: Colors.red,
                        child: Icon(_isRecording ? Icons.stop : Icons.circle),
                        onPressed: () => _recordVideo(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var item in testamentCheckList) _getCheckListButton(item)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Visibility(
                visible: _isRecording,
                child: Container(
                  color: Colors.black54,
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      _isNextEnabled ? _stopRecording() : null;
                    },
                    style: kTestamentNextButtonEnabledStyle,
                    child: Text(
                      'NEXT >',
                      style: _isNextEnabled
                          ? kTestamentNextButtonEnabledTextStyle
                          : kTestamentNextButtonDisabledTextStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
