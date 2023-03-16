import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qfixapp/home/view/home-page.dart';
import 'package:qfixapp/login/bloc/login_bloc.dart';
import 'package:qfixapp/signup/view/signup-page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => HomePage())));
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text (state.errorMessage)));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'QFIX',
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                          fontSize: 74,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff022C43),
                        ),
                      ),
                    ),
                    const Text(
                      'HOUSEHOLD MAINTENANCE MADE EASY',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff707070),
                      ),
                    ),
                    Container(
                      width: 340,
                      height: 490,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffDDDDDD),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 30, color: Colors.indigo[900]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _loginBloc.add(
                                LoginButtonPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFD700),
                              foregroundColor: Colors.white,
                              fixedSize: const Size(230, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password'),
                              ),
                              const Text('|'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('OTP LOGIN'),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Or  Sign In with',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset('assets/images/facebook.png'),
                              const SizedBox(width: 20),
                              Image.asset('assets/images/google.png'),
                              const SizedBox(width: 20),
                              Image.asset('assets/images/instagram.png'),
                            ],
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignupPage())));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff022C43),
                        fixedSize: const Size(230, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xff022C43),
                          ),
                        ),
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
