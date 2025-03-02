// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
                ),
              ),
            ),
          ),

          // Faded Circle (Scales with screen size)
          Positioned(
            top: -screenHeight * 0.15,
            left: -screenWidth * 0.1,
            child: Transform.rotate(
              angle: pi / 6,
              child: Container(
                width: screenWidth * 0.7,
                height: screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(screenWidth * 0.35),
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Email TextField with faded effect
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          color: Colors.grey, size: screenWidth * 0.06),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Buttons Row (Back & Send Email)
                  Row(
                    children: [
                      // Back Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01),
                          ),
                          child: Text("Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04)),
                        ),
                      ),
                      SizedBox(
                          width: screenWidth * 0.03), // Space between buttons

                      // Send Email Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01),
                          ),
                          child: Text("Send Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04)),
                        ),
                      ),
                    ],
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
