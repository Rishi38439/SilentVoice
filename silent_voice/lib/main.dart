import 'package:flutter/material.dart';
import 'login.dart'; // Importing the login.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () {
            return const LoginPage(); // Redirect to LoginPage after 3 seconds
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const LoginPage(); // Show LoginPage
            }
            return Scaffold(
              // Show loading screen while waiting
              body: Container(
                color: const Color(0xFF97D8C4),
                child: Center(
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    height: 600,
                    width: 600,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
