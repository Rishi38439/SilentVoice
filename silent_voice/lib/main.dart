import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xFF97D8C4),
          child: Center(
            child: Image.asset('assets/images/app_logo.png',
                height:600,
                width :600,
                fit: BoxFit.cover,), 
            
          ),
        )
      )
    );
  }
}
