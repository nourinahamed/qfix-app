import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfixapp/login/view/login-page.dart';
import 'package:qfixapp/signup/bloc/signup_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  final _signupBloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signupBloc,
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
           if (state is SignupSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  LoginPage(),
                ),);
          } else if (state is SignupFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'QFIX',
                      style: TextStyle(
                        fontSize: 74,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff022C43),
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
                      height: 567,
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
                      child: Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.indigo[900]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _firstname,
                              decoration:
                                  const InputDecoration(hintText: 'First Name'),
                            ),
                            TextFormField(
                              controller: _lastname,
                              decoration:
                                  const InputDecoration(hintText: 'Last Name'),
                            ),
                            TextFormField(
                              controller: _email,
                              decoration:
                                  const InputDecoration(hintText: 'Email'),
                            ),
                            TextFormField(
                              controller: _password,
                              decoration:
                                  const InputDecoration(hintText: 'Password'),
                            ),
                            TextFormField(
                              controller: _phonenumber,
                              decoration: const InputDecoration(
                                  hintText: 'Phone Number'),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                if (_globalKey.currentState!.validate()) {
                                  _signupBloc.add(
                                    RegisterAccount(
                                      firstname: _firstname.text,
                                      lastname: _lastname.text,
                                      email: _email.text,
                                      password: _password.text,
                                      phonenumber: _phonenumber.text,
                                    ),
                                  );
                                }
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
                            const SizedBox(height: 30),
                            const Text(
                              'Or  Sign Up with',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
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
                    ),
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff022C43),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginPage(),
                          ),
                        );
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
                        'SIGN IN',
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
