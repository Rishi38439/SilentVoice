// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silent_voice/sign_interpreter.dart';
import 'package:silent_voice/sign_concepts.dart';
import '/sign_dict.dart';
import '/login.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({super.key});

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false); // Clear login state

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
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
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Profile & Logout Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                          size: screenWidth * 0.09,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => logout(context),
                              icon: Icon(
                                Icons.logout,
                                color: Colors.black,
                                size: screenWidth * 0.08,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                color: Colors.black,
                                size: screenWidth * 0.08,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Welcome Text
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                    ),
                    child: Text(
                      "Welcome, User!",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.08),

                  /// White Container Section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * 0.05),
                        topRight: Radius.circular(screenWidth * 0.05),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.1),
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
                                  builder: (context) => const SignDictionary(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          _buildMenuButton(
                            icon: Icons.record_voice_over,
                            title: "Sign Learning",
                            subtitle: "Improve your signing skills",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignLearningScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          _buildMenuButton(
                            icon: Icons.front_hand,
                            title: "Sign Interpreter",
                            subtitle: "Get live interpretation",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VideoTextScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Icon(icon, color: Colors.black, size: 40),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
