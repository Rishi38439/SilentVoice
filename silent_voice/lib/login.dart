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
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            bottom: bottomPadding > 0 ? bottomPadding + 20 : 20,
            child: Image.asset(
              'assets/images/honey.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
