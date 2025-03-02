import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/homepage.dart';
import '/forgotpass.dart';
import '/signup.dart';
>>>>>>> origin/ChangesByR

class Login extends StatefulWidget {
  const Login({super.key});

  @override
<<<<<<< HEAD
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
=======
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  /// Check if user is already logged in
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // Redirect to HomeScreen if already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home_screen()),
      );
    }
  }

  /// Function to handle user login
  Future<void> loginUser() async {
    String username = usernameController.text;
    String password = passwordController.text;

    var url = Uri.parse("http://192.168.10.100:5000/api/login");

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("Login successful: $responseData");

        // Save login state
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        // Navigate to Home Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home_screen()),
        );
      } else {
        _showErrorDialog("Invalid username or password");
      }
    } catch (e) {
      _showErrorDialog("Something went wrong. Please try again.");
    }
  }

  /// Function to show error dialogs
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Failed"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
>>>>>>> origin/ChangesByR

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
<<<<<<< HEAD
          Positioned(
            child: Image.asset(
              'assets/images/app_upper_wave.png',
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Text(
                      "Good to see you,",
                      style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Lato",
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Sign in to your account",
                      style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lato",
                      ),
                    ),
                    SizedBox(height: 39),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            offset: Offset(0, 8),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Image.asset(
                              "assets/images/user_assets.png",
                              width: 5,
                              height: 5,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          hintStyle: TextStyle(
                            color: Color(0xff747474),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lato",
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '               Please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 41),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            offset: Offset(0, 8),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Image.asset(
                              "assets/images/password_assets.png",
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          hintStyle: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lato",
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '               Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 34),
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Color(0xff858585),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lato",
                      ),
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle create account
                          },
                          child: Text(
                            'Create',
                            style: TextStyle(
                              color: Color(0xFF5BBCCC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/acc_verification');
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff45b2e0),
                                Color(0xff97d8c4),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 10, 10, 10),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
=======
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
>>>>>>> origin/ChangesByR
                ),
              ),
            ),
          ),
<<<<<<< HEAD
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            bottom: bottomPadding > 0 ? bottomPadding + 20 : 20,
            child: Image.asset(
              'assets/images/honey.png',
              fit: BoxFit.contain,
=======
          // Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Good to see you,",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text("Login to your account",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 30),

                  // Username Field
                  _buildTextField(Icons.person, "Username", usernameController),
                  const SizedBox(height: 20),

                  // Password Field
                  _buildTextField(Icons.lock, "Password", passwordController,
                      obscureText: true),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: const Text("Forgot your password?",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  ElevatedButton(
                    onPressed: loginUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E86C1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                    ),
                    child: const Text("Login",
                        style: TextStyle(color: Colors.white)),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text("Create",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
>>>>>>> origin/ChangesByR
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
=======

  // Function to create text fields with controllers
  Widget _buildTextField(
      IconData icon, String hintText, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
>>>>>>> origin/ChangesByR
}
