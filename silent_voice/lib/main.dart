import 'package:flutter/material.dart';
import 'package:silent_voice/login.dart';

void main() {
  runApp(const SilentVoiceApp());
}

class SilentVoiceApp extends StatelessWidget {
  const SilentVoiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use WidgetsBinding to schedule the navigation after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Start a timer to redirect to the login page after 3 minutes
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login()),
        );
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/app_logo.png', // Replace with your asset path
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
