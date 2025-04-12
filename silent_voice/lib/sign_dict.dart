import 'package:flutter/material.dart';
import 'package:silent_voice/sign_learning.dart';

class SignDictionary extends StatelessWidget {
  const SignDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.center,
                  colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Header with Back Button and Title
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 32),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "Dictionary",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search signs...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Sign List
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      itemCount: signs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              signs[index],
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 18),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoTextScreen()));
                            },
                          ),
                        );
                      },
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
}

// Sample sign list
final List<String> signs = [
  "Hello",
  "Goodbye",
  "Thank you",
  "Welcome",
  "Sorry",
  "Yes",
  "No",
  "Please",
  "Go",
  "Wait",
  "Stop",
  "Sleep",
  "Book",
  "Come",
  "Read",
  "Nice to meet you",
  "Good morning",
  "Good night",
  "Excuse me",
  "Help me",
  "What's your name?",
  "How are you?",
  "I'm fine",
  "I don't understand",
  "Can you repeat that?",
  "Where are you from?",
  "I'm hungry",
  "I'm thirsty",
];
