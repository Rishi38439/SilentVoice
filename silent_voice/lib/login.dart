// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -1,
            top: -310,
            child: Image.asset(
              'assets/images/app_upper_wave.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 168),
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
                      width: 300,
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
                              width: 10,
                              height: 10,
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
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 41),
                    Container(
                      width: 300,
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
                              width: 0,
                              height: 0,
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
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 34),
                    Text(
                      "Forgot  your password?",
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
                          width: 98,
                          height: 34,
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
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            bottom: bottomPadding > 0 ? bottomPadding : 0,
            child: Image.asset(
              'assets/images/honey.png',
              width: 250,
              height: 275,
            ),
          ),
        ],
      ),
    );
  }
}
