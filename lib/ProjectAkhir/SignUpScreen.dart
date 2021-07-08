import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/img/logo.png',
                  fit: BoxFit.contain,
                ),
                height: 230,
                alignment: Alignment.centerRight,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Text('Create Account',
                              style: TextStyle(
                                  color: Color(0xFF033462),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          alignment: Alignment.centerLeft),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock_outlined))),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              await _firebaseAuth
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(10))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
