// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:silent_voice/sign_interpreter.dart';
import 'package:silent_voice/sign_concepts.dart';
import 'dart:math';
import '/sign_dict.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
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

          // Faded Circular Decoration
          Positioned(
            top: -100,
            left: -50,
            child: Transform.rotate(
              angle: pi / 6,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            ),
          ),

          // Home Page Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Profile & Settings Icons (Increased Size)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.person,
                          color: Colors.black, size: 40), // Increased size
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings,
                            color: Colors.black, size: 40), // Increased size
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Welcome Message
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    "Welcome, UserName!",
                    style: TextStyle(
                      fontSize: 28, // Slightly larger font
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Curved White Container
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Column(
                        children: [
                          _buildMenuButton(
                            icon: Icons.menu_book,
                            title: "Sign Dictionary",
                            subtitle: "Explore sign language words",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignDictionary()));
                            },
                          ),
                          const SizedBox(height: 60),
                          _buildMenuButton(
                            icon: Icons.record_voice_over,
                            title: "Sign Learning",
                            subtitle: "Improve your signing skills",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignLearningScreen()));
                            },
                          ),
                          const SizedBox(height: 60),
                          _buildMenuButton(
                            icon: Icons.front_hand,
                            title: "Sign Interpreter",
                            subtitle: "Get live interpretation",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoTextScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Button Widget (Bigger & Icon + Text in Column)
  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50), // More padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Slightly rounded
          gradient: const LinearGradient(
            colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8, // More depth in shadow
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 50), // Left padding
            Icon(icon, color: Colors.black, size: 50), // Bigger icon
            const SizedBox(width: 50), // Space between icon & text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26, // Bigger font
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16, // Slightly smaller
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
