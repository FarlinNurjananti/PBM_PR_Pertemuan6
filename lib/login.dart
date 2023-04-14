import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var loginKey = GlobalKey<FormState>();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Login.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 470.0, right: 20, left: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0)),
              color: Color(0xFFE1CAA7),
            ),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.brown,
                  ),
                ),
                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (dataInputan.isNotEmpty) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email!';
                            } else if (value == dataInputan[1]) {
                              return null;
                            } else {
                              return 'Failed!';
                            }
                          } else {
                            return 'Failed!';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (dataInputan.isNotEmpty) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password!';
                            } else if (value == dataInputan[2]) {
                              return null;
                            } else {
                              return 'Failed!';
                            }
                          } else {
                            return 'Failed!';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (loginKey.currentState!.validate()) {
                              loginKey.currentState!.save();
                              Navigator.pushNamed(context, '/home',
                                  arguments: dataInputan);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(2000, 40),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 15.0),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(2000, 40),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 23.0, vertical: 15.0),
                          ),
                          child: const Text('Sign Up'),
                        ),
                      ),
                    ],
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
