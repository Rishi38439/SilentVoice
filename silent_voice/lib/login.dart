// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        key: Key(
          "Login (267:87)",
        ),
        children: [
          Positioned(
            left: 241,
            top: 529,
            child: Container(
              child: Positioned(
                left: 0,
                top: 0,
                child: Container(
                  child: Container(
                    key: Key(
                      "Rectangle 2 (267:106)",
                    ),
                    width: 98,
                    height: 34,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(
                            0xff45b2e0,
                          ),
                          Color(
                            0xff97d8c4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  width: 98,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      17,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(
                          0xff45b2e0,
                        ),
                        Color(
                          0xff97d8c4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              width: 98,
              height: 34,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 49,
            top: 168,
            child: SizedBox(
              child: Text(
                "Good to see you,",
                key: Key(
                  "Good to see you, (267:88)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff262626,
                  ),
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lato",
                  letterSpacing: 0,
                ),
              ),
              width: 333,
              height: 56,
            ),
          ),
          Positioned(
            left: 91,
            top: 246,
            child: SizedBox(
              child: Text(
                "Sign in to your account",
                key: Key(
                  "Sign in to your account (267:89)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff262626,
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lato",
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
              ),
              width: 223,
              height: 26,
            ),
          ),
          Positioned(
            left: 45,
            top: 313,
            child: Container(
              child: Container(
                key: Key(
                  "container for nested stack of 267:90",
                ),
                child: Stack(
                  key: Key(
                    "Group 1 (267:90)",
                  ),
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        child: Container(
                          key: Key(
                            "Rectangle 1 (267:91)",
                          ),
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x19000000,
                                ),
                                offset: Offset(
                                  0,
                                  8,
                                ),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                0x19000000,
                              ),
                              offset: Offset(
                                0,
                                8,
                              ),
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 14,
                      top: 13,
                      child: Container(
                        child: Container(
                          key: Key(
                            "container for nested stack of 267:92",
                          ),
                          child: Stack(
                            key: Key(
                              "Frame 1 (267:92)",
                            ),
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Image.network(
                                  "grida://assets-reservation/images/267:93",
                                  width: 24,
                                  height: 24,
                                  semanticLabel: "icon",
                                  key: Key(
                                    "profile (267:93)",
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 27,
                                top: 3,
                                child: SizedBox(
                                  child: Text(
                                    "Username",
                                    key: Key(
                                      "Username (267:97)",
                                    ),
                                    style: TextStyle(
                                      color: Color(
                                        0xff747474,
                                      ),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Lato",
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  width: 115,
                                  height: 18,
                                ),
                              ),

                              /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                              Container(),
                            ],
                          ),
                        ),
                        width: 143,
                        height: 24,
                        padding: EdgeInsets.symmetric(),
                        decoration: BoxDecoration(),
                      ),
                    ),

                    /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                    Container(),
                  ],
                ),
              ),
              width: 300,
              height: 50,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 45,
            top: 404,
            child: Container(
              child: Container(
                key: Key(
                  "container for nested stack of 267:98",
                ),
                child: Stack(
                  key: Key(
                    "Group 2 (267:98)",
                  ),
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        child: Container(
                          key: Key(
                            "Rectangle 1 (267:99)",
                          ),
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x19000000,
                                ),
                                offset: Offset(
                                  0,
                                  8,
                                ),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                0x19000000,
                              ),
                              offset: Offset(
                                0,
                                8,
                              ),
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 14,
                      right: 268,
                      bottom: 18.5,
                      child: Image.network(
                        "grida://assets-reservation/images/267:100",
                        width: 14,
                        height: 17.5,
                        key: Key(
                          "Vector (267:100)",
                        ),
                      ),
                    ),
                    Positioned(
                      left: 45,
                      top: 14,
                      child: SizedBox(
                        child: Text(
                          "Password",
                          key: Key(
                            "Password (267:101)",
                          ),
                          style: TextStyle(
                            color: Color(
                              0xff808080,
                            ),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lato",
                            letterSpacing: 0,
                          ),
                        ),
                        width: 115,
                        height: 17,
                      ),
                    ),

                    /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                    Container(),
                  ],
                ),
              ),
              width: 300,
              height: 50,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 191,
            top: 488,
            child: SizedBox(
              child: Text(
                "Forgot  your password?",
                key: Key(
                  "Forgot your password? (267:102)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff858585,
                  ),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lato",
                  letterSpacing: 0,
                ),
              ),
              width: 174,
              height: 24,
            ),
          ),
          Positioned(
            left: 91,
            top: 739,
            child: SizedBox(
              child: Text(
                "Don’t have an account? Create",
                key: Key(
                  "Don’t have an account? Create (267:103)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff262626,
                  ),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lato",
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
              ),
              width: 229,
              height: 24,
            ),
          ),
          Positioned(
            left: 266,
            top: 532,
            child: SizedBox(
              child: Text(
                "Sign in",
                key: Key(
                  "Sign in (267:104)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff262626,
                  ),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lato",
                  height: 1.81,
                  letterSpacing: 0,
                ),
              ),
              width: 81,
              height: 34,
            ),
          ),
          Positioned(
            left: -1,
            top: 0,
            child: Image.network(
              "grida://assets-reservation/images/267:108",
              width: 391,
              height: 119,
              key: Key(
                "Vector 1 (267:108)",
              ),
            ),
          ),
          Positioned(
            left: -275,
            top: 573,
            child: Image.network(
              "grida://assets-reservation/images/267:109",
              width: 369,
              height: 305,
              key: Key(
                "Vector 2 (267:109)",
              ),
            ),
          ),
          Positioned(
            left: -275,
            top: 573,
            child: Image.network(
              "grida://assets-reservation/images/273:177",
              width: 369,
              height: 305,
              key: Key(
                "Vector 3 (273:177)",
              ),
            ),
          ),

          /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
          Container(),
        ],
      ),
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
