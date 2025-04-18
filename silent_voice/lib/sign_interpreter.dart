import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VideoTextScreen extends StatefulWidget {
  const VideoTextScreen({super.key});

  @override
  State<VideoTextScreen> createState() => _VideoTextScreenState();
}

class _VideoTextScreenState extends State<VideoTextScreen> {
  List<CameraDescription>? _cameras;
  CameraController? _controller;
  bool _isProcessing = false;
  String recognizedText = "Recognized Text";
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadModel();
    _initializeCamera();
  }

  Future<void> _loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/sign_model.tflite",
        labels: "assets/labels.txt",
      );
      debugPrint("Model loaded successfully");
    } catch (e) {
      debugPrint("Failed to load model: $e");
    }
  }

  Future<void> _initializeCamera([int cameraIndex = 0]) async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras![cameraIndex],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    await _controller!.initialize();
    _controller!.startImageStream((image) {
      if (!_isProcessing) {
        _isProcessing = true;
        _runModelOnFrame(image);
      }
    });

    if (!mounted) return;
    setState(() {});
  }

  Future<void> _runModelOnFrame(CameraImage image) async {
    try {
      // Extract the bytes from the camera image
      var bytesList = image.planes.map((plane) => plane.bytes).toList();

      // Run the model on the frame
      var predictions = await Tflite.runModelOnFrame(
        bytesList: bytesList,
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5, // This might need adjustment based on your model
        imageStd: 127.5, // This might need adjustment based on your model
        rotation: 90, // Adjust based on camera orientation
        numResults: 2, // Return top 2 results
        threshold: 0.1, // Detection threshold
        asynch: true,
      );

      if (predictions != null && predictions.isNotEmpty) {
        final prediction = predictions[0];
        setState(() {
          // Format: "Label: 95.3%"
          recognizedText =
              "${prediction['label']} ${(prediction['confidence'] * 100).toStringAsFixed(1)}%";
        });
        debugPrint("Prediction: $recognizedText");
      }
    } catch (e) {
      debugPrint("Model run error: $e");
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _toggleCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;

    await _controller?.stopImageStream();
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
    await _initializeCamera(_selectedCameraIndex);
  }

  @override
  void dispose() {
    _controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.12,
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      size: 40, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
                  icon: const Icon(Icons.flip_camera_ios,
                      size: 40, color: Colors.white),
                  onPressed: _toggleCamera,
                ),
              ],
            ),
          ),
          Expanded(
            child: _controller == null || !_controller!.value.isInitialized
                ? const Center(child: CircularProgressIndicator())
                : (_selectedCameraIndex == 1
                    ? Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.1416),
                        child: CameraPreview(_controller!),
                      )
                    : CameraPreview(_controller!)),
          ),
          Container(
            height: screenHeight * 0.18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.05),
                topRight: Radius.circular(screenWidth * 0.05),
              ),
            ),
            child: Center(
              child: Text(
                recognizedText,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
