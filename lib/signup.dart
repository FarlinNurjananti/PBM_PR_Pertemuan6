import 'package:flutter/material.dart';

List<String> dataInputan = [];
TextEditingController nama = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var signupKey = GlobalKey<FormState>();
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
            padding: const EdgeInsets.only(bottom: 470.0, top: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0)),
              color: Color(0xFFE1CAA7),
            ),
            child: Column(
              children: <Widget>[
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.brown,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 40),
                  child: Form(
                    key: signupKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nama,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username!';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email!';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password!';
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                        ),
                        Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              vertical: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              if (signupKey.currentState!.validate()) {
                                signupKey.currentState!.save();
                                dataInputan.add(nama.text);
                                dataInputan.add(email.text);
                                dataInputan.add(password.text);

                                Navigator.pushNamed(context, '/login',
                                    arguments: dataInputan);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(2000, 30)),
                            child: const Text('Sign Up'),
                          ),
                        ),
                      ],
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
