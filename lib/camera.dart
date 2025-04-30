import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String resurl = "";
  CameraController? _controller;
  int _selectedCameraIdx = 0;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.cameras.isNotEmpty) {
      _initCamera(_selectedCameraIdx);
    }
  }

  Future<void> _initCamera(int cameraIdx) async {
    final camera = widget.cameras[cameraIdx];
    _controller = CameraController(camera, ResolutionPreset.high);

    try {
      await _controller!.initialize();
      if (mounted) {
        setState(() => _isCameraInitialized = true);
      }
    } catch (e) {
      print("Camera init error: $e");
    }
  }

  void _switchCamera() {
    if (widget.cameras.length > 1) {
      _selectedCameraIdx = (_selectedCameraIdx + 1) % widget.cameras.length;
      _initCamera(_selectedCameraIdx);
    }
  }

  Future<void> _captureAndSend() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    final tempDir = await getTemporaryDirectory();
    final filePath = join(
      tempDir.path,
      '${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    try {
      final XFile file = await _controller!.takePicture();
      final bytes = await File(file.path).readAsBytes();
      final base64Image = base64Encode(bytes);

      await _sendToApi(base64Image);
    } catch (e) {
      print("Capture error: $e");
    }
  }

  Future<void> _sendToApi(String base64Image) async {
    final url = Uri.parse(
      "https://sdctech.in/Admin/fAmdm/settings_upload_api.php",
    ); // Replace with real URL

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"image": base64Image}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          resurl = data['url'];
        });

        print(data['url']);
        /*var result = json.decode(response.toString());
        print("Image Upload Response Result:$result");*/

        //print("Image Upload Response:$response");
        print("Image uploaded successfully");
      } else {
        print("Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      print("API error: $e");
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cameras.isEmpty) {
      return Scaffold(body: Center(child: Text("No cameras found")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Capture"),
        actions: [
          IconButton(icon: Icon(Icons.switch_camera), onPressed: _switchCamera),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (resurl != '') ? Text(resurl) : SizedBox(),
            _isCameraInitialized
                ? CameraPreview(_controller!)
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _captureAndSend,
        child: Icon(Icons.camera),
      ),
    );
  }
}
