import 'package:flutter/material.dart';
import 'MainApp.dart';
import 'package:finalproject/ProjectAkhir/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/img/logo.png',
                  fit: BoxFit.contain,
                ),
                height: 200,
                alignment: Alignment.center,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Text('Maskapai App',
                              style: TextStyle(
                                  color: Color(0xFF1565C0),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          alignment: Alignment.center),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Email',
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Password',
                            )),
                      ),
                      TextButton(
                        onPressed: () async {},
                        child: Text("Forgot Password?"),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              await _firebaseAuth
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((value) => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => MainApp())));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10))),
                      ),
                      Container(
                          child: Row(children: <Widget>[
                        Text("You done have an account?",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                        TextButton(
                            child: Text("Create Account",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            })
                      ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
