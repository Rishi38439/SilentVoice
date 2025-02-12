import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 142,
                top: 539,
                child: Container(
                  width: 98,
                  height: 34,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.71, -0.71),
                      end: Alignment(-0.71, 0.71),
                      colors: [Color(0xFF45B2E0), Color(0xFF97D8C4)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 168,
                child: SizedBox(
                  width: 313,
                  height: 56,
                  child: SizedBox(
                    width: 313,
                    height: 56,
                    child: Text(
                      'Good to see you,',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 40,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 91,
                top: 246,
                child: SizedBox(
                  width: 203,
                  height: 26,
                  child: SizedBox(
                    width: 203,
                    height: 26,
                    child: Text(
                      'Sign in to your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 18,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 313,
                child: Container(
                  width: 300,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 20,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 13,
                        child: Container(
                          width: 143,
                          height: 24,
                          padding: const EdgeInsets.only(right: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.only(
                                  top: 2.50,
                                  left: 4,
                                  right: 5.81,
                                  bottom: 3.50,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        child: Stack(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 3),
                              SizedBox(
                                width: 115,
                                height: 18,
                                child: SizedBox(
                                  width: 115,
                                  height: 18,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Color(0xFF747474),
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 404,
                child: Container(
                  width: 300,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 20,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 45,
                        top: 14,
                        child: SizedBox(
                          width: 115,
                          height: 17,
                          child: SizedBox(
                            width: 115,
                            height: 17,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 191,
                top: 488,
                child: SizedBox(
                  width: 154,
                  height: 24,
                  child: SizedBox(
                    width: 154,
                    height: 24,
                    child: Text(
                      'Forgot  your password?',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 91,
                top: 739,
                child: SizedBox(
                  width: 209,
                  height: 24,
                  child: SizedBox(
                    width: 209,
                    height: 24,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Create',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 161,
                top: 539,
                child: SizedBox(
                  width: 61,
                  height: 34,
                  child: SizedBox(
                    width: 61,
                    height: 34,
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 1.45,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
