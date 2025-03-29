// ignore_for_file: unused_local_variable

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
  int _selectedCameraIndex = 0;
  String recognizedText = "Recognized Text";
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera([int cameraIndex = 0]) async {
    final cameras = await availableCameras();
    _cameras = cameras;

    if (_cameras == null || _cameras!.isEmpty) {
      debugPrint("No cameras available");
      return;
    }

    _controller = CameraController(
      _cameras![cameraIndex],
      ResolutionPreset.medium, // Medium quality for better performance
      imageFormatGroup: ImageFormatGroup.bgra8888, // Optimized for ML processing
    );

    await _controller!.initialize();
    
    // Start continuous frame processing
    _controller!.startImageStream((CameraImage image) {
      if (!_isProcessing) {
        _processFrame(image);
      }
    });

    if (!mounted) return;
    setState(() {});
  }

  Future<void> _processFrame(CameraImage image) async {
    _isProcessing = true;
    try {
      // TODO: Process frame using ML model
      // This is where you'll add the ML model integration
      // For now, we'll just simulate processing
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        recognizedText = "Live recognition in progress...";
      });
    } catch (e) {
      debugPrint("Error processing frame: $e");
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
    _controller?.stopImageStream();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Gradient Header with Back and Camera Toggle Button
              Container(
                height: screenHeight * 0.1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 40),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: const Icon(Icons.flip_camera_ios, size: 40),
                        onPressed: _toggleCamera,
                      ),
                    ],
                  ),
                ),
              ),

              // Camera Preview with Mirror Effect for Front Camera
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
            ],
          ),

          // Bottom Container with Recognition Text
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.2,
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
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}