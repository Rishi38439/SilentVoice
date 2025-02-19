// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        key: Key(
          "Signup (283:160)",
        ),
        children: [
          Positioned(
            left: 78,
            top: 276,
            child: SizedBox(
              child: Text(
                "Forgot Password",
                key: Key(
                  "Forgot Password (283:161)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff262626,
                  ),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lato",
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
              ),
              width: 238,
              height: 41,
            ),
          ),
          Positioned(
            left: 45,
            top: 356,
            child: Container(
              child: Container(
                key: Key(
                  "container for nested stack of 283:174",
                ),
                child: Stack(
                  key: Key(
                    "Group 4 (283:174)",
                  ),
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        child: Container(
                          key: Key(
                            "Rectangle 1 (283:175)",
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
                      left: 45,
                      top: 14,
                      child: SizedBox(
                        child: Text(
                          "E-mail",
                          key: Key(
                            "E-mail (283:176)",
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
                    Positioned(
                      left: 18,
                      top: 19,
                      child: Container(
                        child: Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            child: Positioned(
                              left: 0,
                              top: 0,
                              right: 0,
                              bottom: 0,
                              child: Image.network(
                                "grida://assets-reservation/images/283:179",
                                width: 14,
                                height: 11.2,
                                key: Key(
                                  "Icons (283:179)",
                                ),
                              ),
                            ),
                            width: 14,
                            height: 11.2,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        width: 14,
                        height: 11.2,
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
            left: -203,
            top: 0,
            child: Image.network(
              "grida://assets-reservation/images/283:189",
              width: 391,
              height: 119,
              key: Key(
                "Vector 1 (283:189)",
              ),
            ),
          ),
          Positioned(
            left: 69,
            top: 556,
            child: Container(
              child: Container(
                key: Key(
                  "Ellipse 1 (283:190)",
                ),
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              width: 2,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 65,
            top: 542,
            child: Container(
              child: Container(
                key: Key(
                  "Rectangle 4 (283:191)",
                ),
                width: 10,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              width: 10,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  1,
                ),
              ),
            ),
          ),
          Positioned(
            left: -267,
            top: 661.24,
            child: Transform.rotate(
              angle: 9.70989725267838,
              child: Image.network(
                "grida://assets-reservation/images/283:221",
                width: 369,
                height: 305,
                key: Key(
                  "Vector 2 (283:221)",
                ),
              ),
            ),
          ),
          Positioned(
            left: 56,
            top: 627,
            right: 300.25,
            bottom: 143.8,
            child: Image.network(
              "grida://assets-reservation/images/283:222",
              width: 33.75,
              height: 73.2,
              key: Key(
                "Vector (283:222)",
              ),
            ),
          ),
          Positioned(
            left: 132,
            top: 449,
            child: Container(
              child: Positioned(
                left: 0,
                top: 0,
                child: Container(
                  child: Container(
                    key: Key(
                      "Rectangle 2 (283:225)",
                    ),
                    width: 146,
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
                            0x9797d8c4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  width: 146,
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
                          0x9797d8c4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              width: 146,
              height: 34,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 156,
            top: 454,
            child: Text(
              "Send Email",
              key: Key(
                "Send Email (283:229)",
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: "Lato",
                letterSpacing: 0,
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