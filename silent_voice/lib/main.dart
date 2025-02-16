import 'package:flutter/material.dart';
import 'package:silent_voice/login.dart';

void main() {
  runApp(const SilentVoiceApp());
}

class SilentVoiceApp extends StatefulWidget {
  const SilentVoiceApp({super.key});

  @override
  State<SilentVoiceApp> createState() => _SilentVoiceAppState();
}

class _SilentVoiceAppState extends State<SilentVoiceApp> {
  bool showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showSplash
          ? Scaffold(
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
                            'assets/images/app_logo.png',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Login(),
    );
  }
}
