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
  bool _isRecording = false;
  String convertedText = "Converted Text";

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
      ResolutionPreset.max, // High-quality resolution
    );

    await _controller!.initialize();
    if (!mounted) return;

    setState(() {});
  }

  Future<void> _toggleCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;

    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
    await _initializeCamera(_selectedCameraIndex);
  }

  Future<void> _startRecording() async {
    if (_controller == null || _controller!.value.isRecordingVideo) return;

    try {
      await _controller!.startVideoRecording();
      setState(() => _isRecording = true);
    } catch (e) {
      debugPrint("Error starting recording: $e");
    }
  }

  Future<void> _stopRecording() async {
    if (_controller == null || !_controller!.value.isRecordingVideo) return;

    try {
      final videoFile = await _controller!.stopVideoRecording();
      setState(() => _isRecording = false);

      // TODO: Send videoFile.path to ML model for conversion
      setState(() {
        convertedText = "Interpreted text will appear here.";
      });

    } catch (e) {
      debugPrint("Error stopping recording: $e");
    }
  }

  @override
  void dispose() {
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
                      // Back Button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 40),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      // Toggle Camera Button
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
                    : (_selectedCameraIndex == 1 // Check if front camera is selected
                        ? Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(3.1416), // Mirror effect
                            child: CameraPreview(_controller!),
                          )
                        : CameraPreview(_controller!)),
              ),
            ],
          ),

          // Bottom Container with Recording Button
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    convertedText,
                    style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    icon: Icon(
                      _isRecording ? Icons.stop : Icons.fiber_manual_record,
                      color: _isRecording ? Colors.red : Colors.black,
                      size: 50,
                    ),
                    onPressed: _isRecording ? _stopRecording : _startRecording,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}