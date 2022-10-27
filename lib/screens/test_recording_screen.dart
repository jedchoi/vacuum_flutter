import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/testament_detail_screen.dart';
import 'package:camera/camera.dart';

class TestRecordingScreen extends StatefulWidget {
  const TestRecordingScreen({Key? key}) : super(key: key);

  @override
  _TestRecordingScreenState createState() => _TestRecordingScreenState();
}

class _TestRecordingScreenState extends State<TestRecordingScreen> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

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
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => TestamentDetailScreen(videoFile: file),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CameraPreview(_cameraController),
            Padding(
              padding: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(_isRecording ? Icons.stop : Icons.circle),
                onPressed: () => _recordVideo(),
              ),
            ),
          ],
        ),
      );
    }
  }
}

// class TestRecordingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text('Test Recording Screen'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               height: 5.0,
//             ),
//             Expanded(
//               flex: 14,
//               child: Center(
//                 child: Text(
//                   "This is Test Recording Page",
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Expanded(
//               flex: 2,
//               child: ElevatedButton(
//                 style: kBottomButtonStyle,
//                 child: Text(
//                   '완료',
//                   style: kButtonTextStyle,
//                 ),
//                 onPressed: () {
//                   print('Test Recording Done. Go to Testament Saving Screen');
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return TestamentDetailScreen();
//                   }));
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
